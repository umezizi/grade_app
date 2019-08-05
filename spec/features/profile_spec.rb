require 'rails_helper'

RSpec.feature "Profiles", type: :feature do
  let(:user) { create(:tom) }

  scenario "プロフィールを編集できること" do
    sign_in user
    visit edit_user_registration_path
    fill_in "Name",             with: "テスト太郎"
    fill_in "Email",            with: "test@test.com"
    fill_in "Profile",          with: "プロフィールテスト"
    fill_in "Current password", with: "password"
    click_button "Update"
    expect(current_path).to eq user_path(user)
    expect(page).to have_content "テスト太郎"
    expect(page).to have_content "プロフィールテスト"
  end
end
