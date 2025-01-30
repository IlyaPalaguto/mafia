class GameSessionsController < ApplicationController

  def new
    @game_session = GameSession.new
  end

  def create
    @game_session = PrepareGameSessionService.new.call(game_session_params)

    respond_to do |format|
      if @game_session.save
        format.html { redirect_to game_session_game_path(@game_session, id: :preparation) }
        format.json { render :show, status: :created, location: @game_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def game_session_params
      params.require(:game_session).permit(:title, players_attributes: [:id, :name, :_destroy])
    end
end
