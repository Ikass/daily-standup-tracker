require 'rails_helper'

RSpec.describe "SignIns", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) do
    FactoryBot.create(:user, {
      password: password,
      password_confirmation: password
    })
  end
  let(:password) { '123456789' }

  it "signs a user in" do
    visit new_session_path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: user.password
    click_button "Sign in"

    expect(current_path).to eq(root_path)
  end

  it "does not sign a user in with invalid credentials" do
    visit new_session_path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: "wrong password"
    click_button "Sign in"

    expect(current_path).to eq(new_session_path)
  end
end
