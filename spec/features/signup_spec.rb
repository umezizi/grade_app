require 'rails_helper'

RSpec.feature "Signups", type: :feature do
  scenario "無効な情報で新規登録に失敗すること"do
    visit new_user_registration_path
    expect {
      fill_in "user_name",          with: ""
      fill_in "user_email",         with: "user@invalid"
      fill_in "user_password",      with: "password"
      fill_in "user_password_confirmation",  with: "pass"
      click_button "登録する"
    }.to change(User, :count).by(0)
    expect(current_path).to eq user_registration_path
  end

  scenario "有効な情報で新規登録に成功すること"do
    visit new_user_registration_path
    expect {
      fill_in "user_name",          with: "山田太郎"
      fill_in "user_email",         with: "user@example.com"
      fill_in "user_password",      with: "password"
      fill_in "user_password_confirmation",  with: "password"
      click_button "登録する"
    }.to change(User, :count).by(1)
    user = User.find_by(email:"user@example.com")
    expect(current_path).to eq root_path
  end
end
