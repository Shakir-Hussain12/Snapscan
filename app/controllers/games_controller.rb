class GamesController < ApplicationController
    def index
        @category = current_user.categories.find(params[:category_id])
        @games = @category.games
        render 'index', locals: {category: @category, games: @games}
    end

    def show
        @game = current_user.games.find(params[:id])
        @category = current_user.categories.find(params[:category_id])
    end

    def new
        @category = current_user.categories.find(params[:category_id])
        @game = current_user.games.new
    end

    def create
        @game = current_user.games.new(game_params)
        if @game.save
            @game.categories << Category.find(params[:game][:category_ids])
            redirect_to category_games_path(params[:game][:category_ids]), notice: t('.success')
        else
            redirect_to new_category_game_path(params[:game][:category_ids]), alert: t('.failure')
        end
    end

    def destroy
        @game = current_user.games.find(params[:id])
        if @game.destroy
            redirect_to category_games_path(params[:category_id]), notice: t('.success')
        else
            redirect_to category_game_path(params[:game][:category_id]), alert: t('.failure')
        end
    end

    private
    
    def game_params
        params.require(:game).permit(:name, :amount, :description, category_ids: [])
    end

end
