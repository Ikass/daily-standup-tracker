require 'rails_helper'

RSpec.describe 'Sign Ups', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'allows a user to sign up' do
    visit new_registration_path

    fill_in 'account_name', with: 'Test Account'
    fill_in 'user_name', with: 'Test User'
    fill_in 'user_email_address', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(current_path).to eq(root_path)
  end

  it 'shows errors when the form is submitted with invalid data' do
    visit new_registration_path

    fill_in 'account_name', with: ''
    fill_in 'user_name', with: ''
    fill_in 'user_email_address', with: ''
    fill_in 'user_password', with: '1'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('Email address can\'t be blank')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Account name can\'t be blank')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
