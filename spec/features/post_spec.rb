require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let(:user) { create(:user) }

  scenario "コメント投稿に成功すること"do
    sign_in user
    visit user_path(user)
    expect {
      fill_in "コメントを入力", with: "コメントテスト"
      find('.search-btn').click
    }.to change(Post, :count).by(1)
    expect(current_path).to eq user_path(user)
    expect(page).to have_content "コメントテスト"
  end
end
