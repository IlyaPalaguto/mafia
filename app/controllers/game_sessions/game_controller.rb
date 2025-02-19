class GameSessions::GameController < ApplicationController
  include Wicked::Wizard

  before_action :set_game_session

  steps :preparation, :speaking, :vote, :night_action, :night_result

  def show
    case step
    when :preparation
      @players = @game_session.players
      @roles = @players.map(&:role)
      # @roles = @game_session.roles.map(&:new)
    when :speaking
      @players = @game_session.players.alive.shuffle
    when :vote
      @vote = @game_session.votes.build
      @players = @game_session.players.alive.shuffle
    when :night_action
      set_next_player
    when :night_result
      # @result = Action.last
    end
    render_wizard
  end

  def update
    case step
    when :vote
      @game_session.votes.create(vote_params)
    when :night_action
      player = @game_session.players.find(player_ability_params[:id])
      @result = player.use_ability(player_ability_params[:action_attributes])

      set_next_player unless @result
    end
    render_wizard @game_session, status: :ok
  end

  private

  def set_next_player
    queue = Rails.cache.fetch("night_#{active_night.id}", expires_in: 30.minutes) do
      game_service.generate_queue_for(active_night)
    end

    @player = queue.shift

    Rails.cache.write("night_#{active_night.id}", queue, expires_in: 20.minutes)
  end

  def active_night
    @active_night ||= @game_session.active_night || @game_session.create_active_night
  end

  def game_service
    Game::Service.new(@game_session)
  end

  def vote_params
    params.require(:vote).permit(:game_session_id, vote_candidates_attributes: [:candidate_id, voter_ids: []])
  end

  def player_ability_params
    params.require(:player).permit(:id, action_attributes: [:target_id, :guess, select_target_ids: [], kill_target_ids: []])
  end

  def set_game_session
    @game_session = GameSession.find(params[:game_session_id])
  end
end
