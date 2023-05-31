class GamesController < ApplicationController
    before_action :fetch_games

    def index
    end

    def show
        @game = current_user.categories.games.find(params[:id])
    end

    def new
        @game = current_user.categories.games.new
    end

    def create
        @game = current_user.categories.games.new(game_params)
        if @game.save
            puts 'success'
            redirect_to games_path, notice: t('.success')
        else
            puts 'failure'
            redirect_to new_category_path, alert: t('.failure')
        end
    end

    private
    def fetch_games
        @games = current_user.categories.games.order(created_at: :desc)
    end

    def game_params
        params.require(:game).permit(:name, :amount)
    end

end
