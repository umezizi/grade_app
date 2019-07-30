require 'rails_helper'

RSpec.feature "Signins", type: :feature do
  let(:user) { create(:user) }

  scenario "ログイン情報に誤りがあり、ログインに失敗すること" do
    visit new_user_session_path
    fill_in "Email",         with: ""
    fill_in "Password",      with: ""
    click_button "Log in"
    expect(current_path).to eq new_user_session_path
  end

  scenario "ログイン情報が正しく、ログインに成功すること" do
    visit new_user_session_path
    fill_in "Email",         with: user.email
    fill_in "Password",      with: user.password
    click_button "Log in"
    expect(current_path).to eq root_path
    # expect(page).to_not have_link user.name         ,  href: user_path
    expect(page).to     have_link '設定',  href: edit_user_registration_path
    expect(page).to     have_link 'ログアウト'      ,  href: destroy_user_session_path
    click_link "ログアウト"
    # expect(current_path).to eq destroy_user_session_path
    # expect(current_path).to eq root_path
    # expect(page).to have_link user.name         ,  href: user_path
    expect(page).to_not     have_link '設定',  href: edit_user_registration_path
    expect(page).to_not     have_link 'ログアウト'      ,  href: destroy_user_session_path
  end
end
