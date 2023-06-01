class GamesController < ApplicationController
    before_action :fetch_games

    def index
    end

    def show
        @game = current_user.games.find(params[:id])
    end

    def new
        @game = current_user.games.new
    end

    def create
        @game = current_user.games.new(game_params)
        if @game.save
            redirect_to category_games_path(current_user.categories.first.id), notice: t('.success')
        else
            redirect_to new_category_game_path(current_user.categories.first.id), alert: t('.`fa`ilure')
        end
    end

    private
    def fetch_games
        # @games = current_user.categories.games.order(created_at: :desc)
        @games = current_user.games
    end

    def game_params
        params.require(:game).permit(:name, :amount)
    end

end
