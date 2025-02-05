class GameSessions::GameController < ApplicationController
  include Wicked::Wizard

  before_action :set_game_session

  steps :preparation, :speaking, :vote, :night

  def show
    case step
    when :preparation
      @players = @game_session.players
      @roles = @game_session.roles.map(&:new)
    when :speaking
      @vote = @game_session.votes.build
      @players = @game_session.players
    when :vote
      @vote = @game_session.votes.build
      @players = @game_session.players
    when :night
      @opts = session[:opts]
    end
    render_wizard
  end

  def update
    case step
    when :vote
      byebug
      @vote = @game_session.votes.build(vote_params)
      if @vote.save
        # game_service.perform_vote(@vote)
      end
      session[:opts] = params[:vote]
    when :night

    end
    render_wizard @game_session, context: @opts
  end

  private

  def vote_params
    params.require(:vote).permit(:game_session_id, vote_candidates_attributes: [:candidate_id, voter_ids: []])
  end

  def set_game_session
    @game_session = GameSession.find(params[:game_session_id])
  end
end
