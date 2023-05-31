require 'rails_helper'

RSpec.describe 'Game', type: :model do
  describe 'Model' do
    before do
      @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
      @game = @user.games.new(name: 'test game', amount: 10)
    end

    it 'is not valid without a name' do
      @game.name = nil
      expect(@game).to_not be_valid
    end

    it 'is not valid without an amount' do
      @game.amount = nil
      expect(@game).to_not be_valid
    end

    it 'is not valid if amount is not an integer' do
      @game.amount = 'abc'
      expect(@game).to_not be_valid
    end

    it 'is not valid if amount is not an integer' do
      @game.amount = 1.234
      expect(@game).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(@game).to be_valid
    end
  end
end
