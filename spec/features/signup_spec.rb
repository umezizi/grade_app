require 'rails_helper'

RSpec.feature "Signups", type: :feature do
  scenario "無効な情報で新規登録に失敗すること"do
    visit new_user_registration_path
    expect {
      fill_in "Name",          with: ""
      fill_in "Email",         with: "user@invalid"
      fill_in "Password",      with: "password"
      fill_in "Password confirmation",  with: "pass"
      click_button "Sign up"
    }.to change(User, :count).by(0)
    expect(current_path).to eq user_registration_path
  end

  scenario "有効な情報で新規登録に成功すること"do
    visit new_user_registration_path
    expect {
      fill_in "Name",          with: "山田太郎"
      fill_in "Email",         with: "user@example.com"
      fill_in "Password",      with: "password"
      fill_in "Password confirmation",  with: "password"
      click_button "Sign up"
    }.to change(User, :count).by(1)
    user = User.find_by(email:"user@example.com")
    expect(current_path).to eq root_path
  end
end
