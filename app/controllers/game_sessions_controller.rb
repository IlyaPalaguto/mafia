class GameSessionsController < ApplicationController

  def new
    @game_session = GameSession.new
  end

  def create
    @game_session = Game::Operations::PrepareGameSession.call(game_session_params)

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

  def test_session
    game_session = GameSession.create

    FactoryBot.create_list(:player, 3, :mafia, game_session:)
    FactoryBot.create_list(:player, 3, :neutral, game_session:)
    FactoryBot.create_list(:player, 6, :civilian, game_session:)

    redirect_to game_session_game_path(game_session, id: :preparation)
  end

  private

    def game_session_params
      params.require(:game_session).permit(:title, players_attributes: [:id, :name, :_destroy])
    end
end
