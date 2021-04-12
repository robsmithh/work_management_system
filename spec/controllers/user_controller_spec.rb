require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe 'allows RESTful routes' do
    it 'should allow user index route' do
      #only want analysts and admins to have access to this view in future
      get :index
      expect(response).to have_http_status(200)
    end

    it 'should allow new user route' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'should allow user show route' do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end

    it 'should allow user edit route' do
      get :edit, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end

    it 'should allow user destroy route' do
      expect do
        delete :destroy, params: { id: @user.id}
      end.to change(User, :count).by(-1)
    end
  end
end
