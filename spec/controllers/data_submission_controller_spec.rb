require 'rails_helper'

RSpec.describe DataSubmissionsController, type: :controller do
  before() do
    @user = User.create(email: "test_user@example.com", password: "password", admin: false, analyst: false)
    @workrequest = WorkRequest.new(scheme_name: 'Scheme1', submission_date: Date.parse('01-01-2020'), report_date: Date.parse('02-01-2020'), issue_method: 'Mailing', project_type: 'Ad-hoc Mailing', office: 'London', status: "Awaiting Approval")
    @workrequest.user = User.first
    @workrequest.save
    @data_submission = DataSubmission.new(actual_submission_date: Date.parse('01-01-2020'), data_location: 'location', source_data: 'source', working_data: 'working', final_data: 'final',
    manipulation_summary: 'manip', data_spec: 'spec', duplicate_members: 'No')
    @data_submission.work_request_id = WorkRequest.last.id
    @data_submission.save
  end

  describe 'allows RESTful routes' do

    it 'should allow data submission show route' do
      get :show, params: { id: @data_submission.id }
      expect(response).to have_http_status(200)
    end

    it 'should allow edit data submission route' do
      get :edit, params: { id: @data_submission.id }
      expect(response).to have_http_status(200)
    end
  end
end
