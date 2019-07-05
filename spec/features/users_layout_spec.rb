require 'rails_helper'

RSpec.feature "UsersLayouts", type: :feature do
  describe "新規登録ページのテスト" do
    before do
      visit users_new_path
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_title "新規登録"
    end

    # it "リンク確認 root" do
    #   expect(page).to have_link 'About', href: about_path
    # end
  end
end
