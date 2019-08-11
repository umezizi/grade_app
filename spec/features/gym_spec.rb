require 'rails_helper'

RSpec.feature "Gyms", type: :feature do
  let(:user) { create(:user, admin: true) }
  let(:gym)  { create(:gym) }

  scenario "ジムの作成に成功すること" do
    sign_in user
    visit new_gym_path
    expect {
      fill_in "gym_gym_name", with: "テストジム"
      fill_in "gym_address",  with: "札幌市西区宮の沢２条２丁目１１−３６"
      fill_in "gym_details",  with: "テスト備考"
      select  "北海道", from: "gym_prefecture"
      click_button "ジムを作成する"
    }.to change(Gym, :count).by(1)
    expect(page).to have_content "テストジム"
    expect(page).to have_content "北海道札幌市西区宮の沢２条２丁目１１−３６"
    expect(page).to have_content "テスト備考"
  end

  scenario "ジムの編集に成功すること" do
    sign_in user
    visit edit_gym_path(gym)
    fill_in "gym_gym_name", with: "テストジム"
    fill_in "gym_address",  with: "札幌市西区宮の沢２条２丁目１１−３６"
    fill_in "gym_details",  with: "テスト備考"
    select  "北海道", from: "gym_prefecture"
    click_button "ジムを更新する"
    expect(page).to have_content "テストジム"
    expect(page).to have_content "北海道札幌市西区宮の沢２条２丁目１１−３６"
    expect(page).to have_content "テスト備考"
  end
end
