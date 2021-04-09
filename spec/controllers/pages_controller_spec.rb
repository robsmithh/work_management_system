require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'it should allow routes' do

    it 'should get home' do
      get :home
      expect(response).to have_http_status(200)
    end
  end
end
