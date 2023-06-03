require 'rails_helper'

RSpec.describe 'Category', type: :model do
  describe 'Model' do
    before do
      @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                          password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
      @category = @user.categories.new(name: 'test category', icon: 'my-icon')
    end

    it 'is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'is not valid without an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(@category).to be_valid
    end
  end
end
