require 'rails_helper'

RSpec.describe "Create contact", :type => :system do
  it 'enables creation of contact with valid credentials' do
    when_i_arrive_on_home_page
    create_user_and_log_in(true)
    and_click_contact_link
    then_i_arrive_on_contact_page

    when_i_click_create_contact
    then_i_arrive_on_new_contact_page

    when_i_enter_invalid_contact_details_1
    and_i_click_create_contact_button
    then_i_am_told_the_contact_details_were_invalid_1

    when_i_enter_invalid_contact_details_2
    and_i_click_create_contact_button
    then_i_am_told_the_contact_details_were_invalid_2

    when_i_enter_valid_contact_details
    and_i_click_create_contact_button
    then_i_am_taken_to_contact_page
    and_i_am_told_the_contact_was_added_successfully

    when_i_click_edit_article
    then_i_arrive_on_edit_contact_page

    when_i_enter_invalid_contact_details_1
    and_i_click_update_contact
    then_i_am_told_the_contact_details_were_invalid_1

    when_i_enter_invalid_contact_details_2
    and_i_click_update_contact
    then_i_am_told_the_contact_details_were_invalid_2

    when_i_edit_with_valid_details
    and_i_click_update_contact
    then_i_am_taken_to_contact_page
    and_i_am_told_the_contact_was_updated_successfully

    when_i_click_delete
    and_i_click_confirm
    then_i_am_taken_to_contact_page
    and_i_am_told_the_contact_was_deleted_successfully
  end

  def when_i_arrive_on_home_page
    visit '/'
  end

  def and_click_contact_link
    click_link 'Contact'
  end

  def then_i_arrive_on_contact_page
    expect(page).to have_current_path(contacts_path)
  end

  def when_i_click_create_contact
    click_link 'Create contact'
  end

  def then_i_arrive_on_new_contact_page
    expect(page).to have_current_path(new_contact_path)
  end

  def when_i_enter_invalid_contact_details_2
    fill_in 'first_name', with: 'T'
    fill_in 'last_name', with: 'C'
    fill_in 'email', with: 'testcontact@example.com.'
    fill_in 'job_role', with: 'J'
    fill_in 'phone_number', with: '12'
  end

  def then_i_am_told_the_contact_details_were_invalid_2
    expect(page).to have_text("First name is too short (minimum is 2 characters)")
    expect(page).to have_text("Last name is too short (minimum is 2 characters)")
    expect(page).to have_text("Phone number is too short (minimum is 5 characters)")
    expect(page).to have_text("Job role is too short (minimum is 2 characters)")
    expect(page).to have_text("Email is invalid")
  end

  def when_i_enter_invalid_contact_details_1
    fill_in 'first_name', with: ''
    fill_in 'last_name', with: ''
    fill_in 'email', with: ''
    fill_in 'job_role', with: ''
    fill_in 'phone_number', with: ''
  end

  def then_i_am_told_the_contact_details_were_invalid_1
    expect(page).to have_text("First name can't be blank")
    expect(page).to have_text("Last name can't be blank")
    expect(page).to have_text("Phone number can't be blank")
    expect(page).to have_text("Job role can't be blank")
    expect(page).to have_text("Email can't be blank")
  end

  def when_i_enter_valid_contact_details
    fill_in 'first_name', with: 'Test'
    fill_in 'last_name', with: 'Contact'
    fill_in 'email', with: 'testcontact@example.com'
    fill_in 'job_role', with: 'Job Role'
    fill_in 'phone_number', with: '12345678901'
  end

  def and_i_click_create_contact_button
    click_button "Create contact"
  end

  def then_i_am_taken_to_contact_page
    expect(page).to have_current_path(contacts_path)
  end

  def and_i_am_told_the_contact_was_added_successfully
    expect(page).to have_text('Contact added successfully')
  end

  def when_i_click_edit_article
    click_link 'Edit'
  end

  def then_i_arrive_on_edit_contact_page
    expect(page).to have_current_path(edit_contact_path(Contact.last.id))
  end

  def and_i_click_update_contact
    click_button "Update contact"
  end

  def when_i_edit_with_valid_details
    fill_in 'first_name', with: 'Test1'
    fill_in 'last_name', with: 'Contact1'
    fill_in 'email', with: 'testcontact1@example.com'
    fill_in 'job_role', with: 'Job Role1'
    fill_in 'phone_number', with: '12345678900'
  end

  def and_i_am_told_the_contact_was_updated_successfully
    expect(page).to have_text('Contact updated successfully')
  end

  def when_i_click_delete
    click_link 'Delete'
  end

  def and_i_click_confirm
    page.driver.browser.switch_to.alert.accept
  end

  def and_i_am_told_the_contact_was_deleted_successfully
    expect(page).to have_current_path(contacts_path)
  end
end
