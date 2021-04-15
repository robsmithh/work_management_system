require 'rails_helper'

RSpec.describe WorkRequestsController, type: :controller do
  before() do
    @workrequest = WorkRequest.create(scheme_name: 'Scheme1', submission_date: Date.parse('01-01-2020'), report_date: Date.parse('02-01-2020'), issue_method: 'Mailing', project_type: 'Ad-hoc Mailing', office: 'London')
  end
  describe 'it should allow routes' do

    it 'allow work request index route' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'allow work request new route' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'allow work request show route' do
      get :show, params: { id: @workrequest.id }
      expect(response).to have_http_status(200)
    end

    it 'allow work request edit route' do
      get :edit, params: { id: @workrequest.id }
      expect(response).to have_http_status(200)
    end

    it 'allow work request destroy route' do
      expect do
        @workrequest.delete
      end.to change(WorkRequest, :count).by(-1)
    end
  end
end
