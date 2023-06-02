require 'rails_helper'

RSpec.describe 'Games', type: :request do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @category = @user.categories.create(name: 'test_category', description: 'test description', icon: 'test_icon')
    @game = @user.games.create(name: 'test_game', description: 'test description', amount: 10)
    post user_session_path params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET categories/:id/games' do
    it 'returns http success' do
      get category_games_path(@category.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get new_category_game_path(@category.id)
      expect(response).to render_template('new').or(render_template('games/new'))
    end

    it 'redirects to game page' do
      get category_games_path(@category.id)
      expect(response.body).to include('Games')
    end

    it 'page to have an amount' do
      get category_games_path(@category.id)
      expect(response.body).to include(@game.amount.to_s)
    end
  end

  describe 'POST categories/:id/games' do
    it 'returns http success' do
      post category_games_path(@category.id), params: { game: { name: 'test_game', description: 'test description', amount: 10, category_ids: @category.id } }
      expect(response).to have_http_status(302)
    end

    it 'redirects to the games page on valid params' do
      post category_games_path(@category.id), params: { game: { name: 'test_game', description: 'test description', amount: 10, category_ids: @category.id } }
      expect(response).to redirect_to(category_games_path(@category.id))
    end

    it 'should create a game on valid params' do
      post category_games_path(@category.id), params: { game: { name: 'test_game', description: 'test description', amount: 10, category_ids: @category.id } }
      expect(@user.games.count).to match(2)
    end    

    it 'does not create a game on invalid params' do
      post category_games_path(@category.id), params: { game: { name: '', description: 'test description', amount: 10, category_ids: @category.id } }
      expect(@user.games.count).to eq(1)
    end

    it 'page to have a game on valid params' do
      post category_games_path(@category.id), params: { game: { name: 'test_game1', description: 'test description', amount: 10, category_ids: @category.id } }
      get category_games_path(@category.id)
      expect(response.body).to include('test_game')
    end

    it 'page to have an amount on valid params' do
      post category_games_path(@category.id), params: { game: { name: 'test_game', description: 'test description', amount: 20, category_ids: @category.id } }
      get category_games_path(@category.id)
      expect(response.body).to include('10')
    end
  end

end
