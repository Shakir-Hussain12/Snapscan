require 'rails_helper'

RSpec.describe 'Category', type: :request do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @category = @user.categories.create(name: 'test_category', icon: 'test_icon')

    post user_session_path params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET categories' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get new_category_path
      expect(response).to render_template('new').or(render_template('categories/new'))
    end

    it 'page to have a category' do
      get categories_path
      expect(response.body).to include(@category.name)
    end

    it 'page to have an icon' do
      get categories_path
      expect(response.body).to include(@category.icon)
    end
  end

  describe 'POST categories' do
    it 'returns http success' do
      post categories_path, params: { category: { name: 'test_category', icon: 'my-icon' } }
      expect(response).to have_http_status(302)
    end

    it 'redirects to the categories page on valid params' do
      post categories_path, params: { category: { name: 'test_category', icon: 'my-icon' } }
      expect(response).to redirect_to(categories_path)
    end

    it 'redirects to the new page on invalid params' do
      post categories_path, params: { category: { name: '', icon: 'my-icon' } }
      expect(response).to redirect_to(new_category_path)
    end

    it 'should create a category on valid params' do
      post categories_path, params: { category: { name: 'test_category', icon: 'my-icon' } }
      expect(@user.categories.count).to match(2)
    end    

    it 'does not create a category on empty name param' do
      post categories_path, params: { category: { name: '', icon: 'my-icon' } }
      expect(@user.categories.count).to eq(1)
    end

    it 'does not create a category on empty icon param' do
      post categories_path, params: { category: { name: 'test_category', icon: '' } }
      expect(@user.categories.count).to eq(1)
    end

    it 'page to have a category on valid params' do
      post categories_path, params: { category: { name: 'test_category1', icon: 'my-icon' } }
      get categories_path
      expect(response.body).to include('test_category1')
    end

    it 'page to have an icon on valid params' do
      post categories_path, params: { category: { name: 'test_category', icon: 'other_icon' } }
      get categories_path
      expect(response.body).to include('other_icon')
    end
  end

end
