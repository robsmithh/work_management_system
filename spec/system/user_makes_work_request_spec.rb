require 'rails_helper'
RSpec.describe 'create work request', :type => :system do
  it 'enables the creation of a work request' do
    when_i_arrive_on_home_page
    create_user_and_log_in(false)
    and_i_click_my_requests
    then_i_am_taken_to_the_requests_index_page

    when_i_click_new_request
    then_i_am_taken_to_the_new_request_page

    when_i_enter_invalid_credentials_1
    and_i_click_create_request
    then_i_am_told_i_have_entered_invalid_credentials_1

    when_i_enter_invalid_credentials_2
    and_i_click_create_request
    then_i_am_told_i_have_entered_invalid_credentials_2

    when_i_enter_valid_credentials
    and_i_click_create_request
    then_i_am_taken_to_the_requests_index_page
    and_i_am_told_my_request_was_added
  end

  def when_i_arrive_on_home_page
    visit '/'
  end

  def and_i_click_my_requests
    click_link 'My requests'
  end

  def then_i_am_taken_to_the_requests_index_page
    expect(page).to have_current_path(work_requests_path)
  end

  def when_i_click_new_request
    click_button 'New Request'
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
    expect(page).to have_text("scheme_name can't be blank")
    expect(page).to have_text("submission_date can't be blank")
    expect(page).to have_text("report_date can't be blank")
    expect(page).to have_text("issue_method can't be blank")
    expect(page).to have_text("project_type can't be blank")
    expect(page).to have_text("office can't be blank")
  end

  def then_i_am_told_i_have_entered_invalid_credentials_2
    expect(page).to have_text("scheme_name can't be blank")
    expect(page).to have_text("submission_date can't be blank")
    expect(page).to have_text("report_date can't be blank")
    expect(page).to have_text("issue_method can't be blank")
    expect(page).to have_text("project_type can't be blank")
    expect(page).to have_text("office can't be blank")
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
    expect(page).to have_text('Request added successfully')
  end

end
