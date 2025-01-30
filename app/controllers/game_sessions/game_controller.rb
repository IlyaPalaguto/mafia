class GameSessions::GameController < ApplicationController
  include Wicked::Wizard

  before_action :set_game_session

  steps :preparation, :day, :night

  def show
    case step
    when :preparation
      @players = @game_session.players
      @roles = @game_session.roles.map(&:new)
    when :day
    when :night

    end
    render_wizard
  end

  def update
    case step
    when :day

    when :night

    end
    render_wizard @game_session
  end

  private

  def set_game_session
    @game_session = GameSession.find(params[:game_session_id])
  end
end
