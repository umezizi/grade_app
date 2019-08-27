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

  scenario "ログインしていない場合、各種ボタンが表示されないこと" do
    visit gym_path(gym)
    expect(page).to_not have_button "編集"
    expect(page).to_not have_button "ホームジム登録"
    expect(page).to_not have_button "ホームジム解除"
    expect(page).to_not have_button "レビューする"
  end

  scenario "ホームジム登録と解除が出来ること" do
    sign_in user
    visit gym_path(gym)
    click_button "ホームジム登録"
    expect(page).to have_button "ホームジム解除"
    visit user_path(user)
    expect(page).to have_content "MyGym"
    visit gym_path(gym)
    click_button "ホームジム解除"
    expect(page).to have_button "ホームジム登録"
    visit user_path(user)
    expect(page).to_not have_content "MyGym"
  end
end
