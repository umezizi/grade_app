require 'rails_helper'

RSpec.feature "Profiles", type: :feature do
  let(:user) { create(:tom) }

  scenario "プロフィールの編集に失敗すること" do
    sign_in user
    visit edit_user_registration_path
    fill_in "user_name",     with: ""
    fill_in "user_email",    with: ""
    fill_in "user_profile",  with: "プロフィールテスト"
    click_button "更新する"
    expect(current_path).to eq user_registration_path
  end

  scenario "プロフィールの編集に成功すること" do
    sign_in user
    visit edit_user_registration_path
    fill_in "user_name",     with: "テスト太郎"
    fill_in "user_email",    with: "test@test.com"
    fill_in "user_profile",  with: "プロフィールテスト"
    click_button "更新する"
    expect(current_path).to eq user_path(user)
    expect(page).to have_content "アカウント情報を変更しました。"
    expect(page).to have_content "テスト太郎"
    expect(page).to have_content "プロフィールテスト"
  end

  scenario "パスワードの変更に失敗すること" do
    sign_in user
    visit edit_user_registration_path
    fill_in "user_password",              with: ""
    fill_in "user_password_confirmation", with: "pass"
    click_button "更新する"
    expect(current_path).to eq user_registration_path
  end

  scenario "パスワードの変更に成功すること" do
    sign_in user
    visit edit_user_registration_path
    fill_in "user_password",              with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "更新する"
    expect(current_path).to eq user_path(user)
    expect(page).to have_content "アカウント情報を変更しました。"
  end

  scenario "ユーザーが削除できること" do
    sign_in user
    visit edit_user_registration_path
    expect {
      click_button "アカウント削除"
    }.to change(User, :count).by(-1)
    expect(current_path).to eq root_path
    expect(page).to have_content "アカウントを削除しました。"
  end
end
