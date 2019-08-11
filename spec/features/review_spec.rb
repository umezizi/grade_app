require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  let(:user) { create(:user) }
  let(:gym)  { create(:gym) }

  scenario "レビュー投稿に失敗すること" do
    sign_in user
    visit new_gym_review_path(gym)
    expect {
      fill_in "review_title",   with: ""
      fill_in "review_content", with: ""
      find('.btn-info').click
    }.to change(Review, :count).by(0)
    expect(current_path).to eq gym_reviews_path(gym)
  end

  scenario "レビュー投稿に成功すること" do
    sign_in user
    visit new_gym_review_path(gym)
    expect {
      fill_in "review_title",   with: "タイトルテスト"
      fill_in "review_content", with: "本文テスト"
      select  "1", from: "review_grade"
      select  "2", from: "review_breadth"
      select  "3", from: "review_wall_height"
      select  "4", from: "review_congestion"
      find('.btn-info').click
    }.to change(Review, :count).by(1)
    expect(current_path).to eq gym_path(gym)
    expect(page).to have_content "タイトルテスト"
    expect(page).to have_content "本文テスト"
    expect(page).to have_content "1.0"
    expect(page).to have_content "2.0"
    expect(page).to have_content "3.0"
    expect(page).to have_content "4.0"
  end
end
