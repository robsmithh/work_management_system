require 'rails_helper'
RSpec.describe 'user creates work request and analyst confirms it', :type => :system do
  it 'enables analyst user to confirm a valid work request' do
    when_i_arrive_on_home_page
    create_user_and_log_in(false, false)
    create_work_request
    and_i_click_my_requests
    then_i_am_taken_to_the_requests_index_page
    and_i_can_see_the_request_i_have_made

    when_i_click_sign_out
    then_i_am_taken_to_the_home_page
    and_i_am_told_i_have_signed_out_successfully

    create_user_and_log_in(false, true, "test_user1@example.com")
    when_i_click_on_awaiting_approval
    then_i_am_taken_to_the_aa_index_page
    and_i_see_request_made_by_user

    when_i_click_the_scheme_name_link
    then_i_am_taken_to_the_show_request_page

    when_i_click_confirm_request
    then_i_am_taken_to_the_aa_index_page
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

  def and_i_can_see_the_request_i_have_made
    expect(page).to have_text(WorkRequest.last.id)
    expect(page).to have_text(WorkRequest.last.scheme_name)
  end

  def when_i_click_sign_out
    click_link 'Sign out'
  end

  def then_i_am_taken_to_the_home_page
    expect(page).to have_current_path(root_path)
  end

  def and_i_am_told_i_have_signed_out_successfully
    expect(page).to have_text('Signed out successfully.')
  end

  def when_i_click_on_awaiting_approval
    click_link 'Awaiting approval'
  end

  def then_i_am_taken_to_the_aa_index_page
    expect(page).to have_current_path(awaiting_approval_path)
  end

  def and_i_see_request_made_by_user
    expect(page).to have_text(WorkRequest.last.scheme_name)
  end

  def when_i_click_the_scheme_name_link
    click_link WorkRequest.last.scheme_name
  end

  def then_i_am_taken_to_the_show_request_page
    expect(page).to have_text(WorkRequest.last.scheme_name)
  end

  def when_i_click_confirm_request
    click_link 'Confirm request'
  end
end
