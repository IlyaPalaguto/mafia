class GameSessionsController < ApplicationController
  before_action :set_game_session, only: %i[ show update ]

  def show
  end

  def new
    @game_session = GameSession.new
  end

  def create
    @game_session = PrepareGameSessionService.new.call(game_session_params)

    respond_to do |format|
      if @game_session.save
        format.html { redirect_to game_session_url(@game_session), notice: "Game session was successfully created." }
        format.json { render :show, status: :created, location: @game_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private

    def set_game_session
      @game_session = GameSession.find(params[:id])
    end

    def game_session_params
      params.require(:game_session).permit(:title, players_attributes: [:id, :name, :_destroy])
    end
end
