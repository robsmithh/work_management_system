require 'rails_helper'


RSpec.describe 'Create user and sign in', :type => :system do
  it 'enables the creation of a user and for the user to sign in' do
    when_i_arrive_on_the_homepage
    and_i_click_sign_up
    then_i_am_taken_to_the_sign_up_page

    when_i_enter_invalid_credentials_1
    and_i_click_create_account
    then_i_am_told_i_have_entered_invalid_values_1

    when_i_enter_invalid_credentials_2
    and_i_click_create_account
    then_i_am_told_i_have_entered_invalid_values_2

    when_i_enter_valid_credentials
    and_i_click_create_account
    then_i_am_taken_to_the_homepage
    and_i_am_told_the_account_was_created_successfully

    when_i_click_sign_in
    then_i_am_taken_to_the_sign_in_page

    when_i_enter_invalid_credentials
    and_i_click_sign_in
    then_i_am_told_i_have_entered_invalid_credentials

    when_i_enter_valid_credentials
    and_i_click_sign_in
    then_i_am_taken_to_the_homepage
    and_i_am_told_i_have_signed_in_successfully

    when_i_click_sign_out
    then_i_am_taken_to_the_homepage
    and_i_am_told_i_have_signed_out_successfully
  end

  def when_i_arrive_on_the_homepage
    visit '/'
  end

  def and_i_click_sign_up
    click_link 'Sign up'
  end

  def then_i_am_taken_to_the_sign_up_page
    expect(page).to have_current_path(signup_path)
  end

  def when_i_enter_invalid_credentials_1
    fill_in 'first_name', with: ''
    fill_in 'last_name', with: ''
    fill_in 'email', with: ''
    fill_in 'username', with: ''
  end

  def when_i_enter_invalid_credentials_2
    fill_in 'first_name', with: 'a' * 41
    fill_in 'last_name', with: 'a' * 41
    fill_in 'email', with: 'testuser@example.com.'
    fill_in 'username', with: 'a' * 4
  end

  def and_i_click_create_account
    click_button 'Create account'
  end

  def then_i_am_told_i_have_entered_invalid_values_1
    expect(page).to have_text("First name can't be blank")
    expect(page).to have_text("Last name can't be blank")
    expect(page).to have_text("Phone number can't be blank")
    expect(page).to have_text("Job role can't be blank")
    expect(page).to have_text("Email can't be blank")
  end

  def then_i_am_told_i_have_entered_invalid_values_2
    expect(page).to have_text("First name is too short (minimum is 2 characters)")
    expect(page).to have_text("Last name is too short (minimum is 2 characters)")
    expect(page).to have_text("Phone number is too short (minimum is 5 characters)")
    expect(page).to have_text("Job role is too short (minimum is 2 characters)")
    expect(page).to have_text("Email is invalid")
  end

  def when_i_enter_valid_credentials
    fill_in 'first_name', with: 'test'
    fill_in 'last_name', with: 'user'
    fill_in 'email', with: 'testuser@example.com'
    fill_on 'username', with: 'test_user'
  end

  def then_i_am_taken_to_the_homepage
    expect(page).to have_current_path(root_path)
  end

  def and_i_am_told_the_account_was_created_successfully
    expect(page).to have_text('Account created successfully')
  end

  def when_i_click_sign_in
    click_link 'Sign in'
  end

  def then_i_am_taken_to_the_sign_in_page
    expect(page).to have_current_path(signin_path)
  end

  def when_i_enter_invalid_credentials
    fill_in 'email', with: 'testuser1@example.com'
    fill_in 'password', with: 'password1'
  end

  def and_i_click_sign_in
    click_button 'Sign in'
  end

  def then_i_am_told_i_have_entered_invalid_credentials
    expect(page).to have_text('Invalid email or password')
  end

  def when_i_enter_valid_credentials
    fill_in 'email', with: 'testuser@example.com'
    fill_in 'password', with: 'password'
  end

  def and_i_am_told_i_have_signed_in_successfully
    expect(page).to have_text('Sign in successful')
  end

  def when_i_click_sign_out
    click_link 'Sign out'
  end

  def and_i_am_told_i_have_signed_out_successfully
    expect(page).to have_text('Sign out successful')
  end
end
