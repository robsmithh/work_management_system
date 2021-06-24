require 'rails_helper'
RSpec.describe 'user submits data', :type => :system do
  it 'ensures user is able to submit valid data for an approved request' do
    when_i_arrive_on_home_page
    @user = create_user_and_log_in(false, false)
    and_i_click_my_requests
    then_i_am_taken_to_the_requests_index_page
    when_i_click_new_request
    then_i_am_taken_to_the_new_request_page

    when_i_enter_invalid_credentials_1
    and_i_click_create_request
    then_i_am_told_i_have_entered_invalid_credentials_1

    when_i_enter_valid_credentials
    and_i_click_create_request
    then_i_am_taken_to_the_requests_index_page
    and_i_am_told_my_request_was_added

    when_i_click_data_submission
    then_i_am_taken_to_the_data_submission_page
    and_i_click_submit_data
    then_i_am_taken_to_the_data_submission_edit_page

    when_i_enter_valid_submission_credentials
    and_i_click_submit_data_button
    then_i_am_taken_to_the_request_page
    and_i_am_told_data_was_submitted_successfully
  end

  def when_i_arrive_on_home_page
    visit '/'
  end

  def and_i_click_my_requests
    click_link 'My Requests'
  end

  def then_i_am_taken_to_the_requests_index_page
    expect(page).to have_current_path(work_requests_path)
  end

  def when_i_click_new_request
    click_link 'New request'
  end

  def then_i_am_taken_to_the_new_request_page
    expect(page).to have_current_path(new_work_request_path)
  end

  def when_i_enter_invalid_credentials_1
    fill_in 'scheme_name', with: ''
    fill_in 'submission_date', with: ''
    fill_in 'report_date', with: ''
    fill_in 'issue_method', with: ''
    fill_in 'project_type', with: ''
    fill_in 'office', with: ''
  end

  def when_i_enter_invalid_credentials_2
    fill_in 'scheme_name', with: 'Please Select'
    fill_in 'submission_date', with: '12/13/2020'
    fill_in 'report_date', with: '12/13/2020'
    fill_in 'issue_method', with: 'Please Select'
    fill_in 'project_type', with: 'Please Select'
    fill_in 'office', with: 'Please Select'
  end

  def and_i_click_create_request
    click_button 'Create request'
  end

  def then_i_am_told_i_have_entered_invalid_credentials_1
    expect(page).to have_text("Scheme name can't be blank")
    expect(page).to have_text("Submission date can't be blank")
    expect(page).to have_text("Report date can't be blank")
    expect(page).to have_text("Issue method can't be blank")
    expect(page).to have_text("Project type can't be blank")
    expect(page).to have_text("Office can't be blank")
  end

  def when_i_enter_valid_credentials
    fill_in 'scheme_name', with: 'Scheme 1'
    fill_in 'submission_date', with: '01/01/2021'
    fill_in 'report_date', with: '02/01/2021'
    fill_in 'issue_method', with: 'Mailing'
    fill_in 'project_type', with: 'Ad-hoc mailing'
    fill_in 'office', with: 'Bristol'
  end

  def and_i_am_told_my_request_was_added
    expect(page).to have_text('Request successfully created')
  end

  def when_i_click_data_submission
    click_link 'Data Submission'
  end

  def then_i_am_taken_to_the_data_submission_page
    expect(page).to have_text('Submission for ')
  end

  def and_i_click_submit_data
    click_link "Submit Data"
  end

  def then_i_am_taken_to_the_data_submission_edit_page
    expect(page).to have_text('Submit Data')
  end

  def and_i_click_submit_data_button
    click_button "Submit Data"
  end

  def when_i_enter_valid_submission_credentials
    fill_in 'data_location', with: 'hyperlink'
    fill_in 'source_data', with: 'source'
    fill_in 'working_data', with: 'working'
    fill_in 'final_data', with: 'final'
    fill_in 'manipulation_summary', with: 'manip'
    fill_in 'data_spec', with: 'spec'
    fill_in 'duplicate_members', with: "False"
  end

  def then_i_am_taken_to_the_request_page
    expect(page).to have_current_path(work_requests_path)
  end

  def and_i_am_told_data_was_submitted_successfully
    expect(page).to have_text('Data submitted successfully')
  end
end
