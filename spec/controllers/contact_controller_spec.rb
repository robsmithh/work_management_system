require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  before() do
    @contact = Contact.create(first_name: 'john', last_name: 'doe', email: 'johndoe@example.com', job_role: 'Job Role', phone_number: '12345678901')
  end

  describe 'allows RESTful routes' do

    it 'should allow contact index route' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'should allow new contact route' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'should allow edit contact route' do
      get :edit, params: { id: @contact.id }
      expect(response).to have_http_status(200)
    end

    it 'should allow destroy contact route' do
      expect do
        delete :destroy, params: { id: @contact.id }
      end.to change(Contact, :count).by(-1)
    end
  end
end
