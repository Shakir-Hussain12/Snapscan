require 'rails_helper'

RSpec.describe 'User', type: :model do
  before(:each) do
    @user = User.create(name: 'Test_user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
  end

  describe 'Model' do
    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid with a name shorter than 5 characters' do
      @user.name = 'a' * 4
      expect(@user).to_not be_valid
    end

    it 'is not valid with a name longer than 50 characters' do
      @user.name = 'a' * 51
      expect(@user).to_not be_valid
    end
  end
end
