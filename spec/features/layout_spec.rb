require 'rails_helper'

RSpec.feature "Layouts", type: :feature do
  describe "ホームページのテスト" do
    before do
      visit root_path   # 名前付きルートを使用
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_title "GradeShare"
    end

    it "リンク確認 root" do
      expect(page).to have_link 'ABOUT', href: about_path
    end
  end

  describe "Aboutページのテスト" do
    before do
      visit about_path   # 名前付きルートを使用
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_title "ABOUT"
    end
  end
end
