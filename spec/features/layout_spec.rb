require 'rails_helper'

RSpec.feature "Layouts", type: :feature do
  describe "ホームページのテスト" do
    let(:user) { create(:user) }

    before do
      visit root_path
    end

    scenario "タイトルが正しく表示されていること" do
      expect(page).to have_title "GradeShare"
    end

    scenario "リンク確認(ログイン前)  root" do
      expect(page).to have_link 'HOME' ,    href: root_path
      expect(page).to have_link 'ABOUT',    href: about_path
      expect(page).to have_link 'SIGN UP',  href: new_user_registration_path
      expect(page).to have_link 'LOGIN',    href: new_user_session_path
      expect(page).to have_link 'はじめる', href: new_user_registration_path
    end

    scenario "リンク確認(ログイン後） root" do
      sign_in user
      visit root_path
      expect(page).to have_link 'HOME' ,    href: root_path
      expect(page).to have_link 'ABOUT',    href: about_path
      expect(page).to have_link "COMMENTS", href: user_path(user)
      expect(page).to have_link "ジム追加",     href: new_gym_path
      expect(page).to have_link "ユーザー一覧", href: users_path
      expect(page).to have_link "設定",         href: edit_user_registration_path
      expect(page).to have_link "ログアウト",   href: destroy_user_session_path
      expect(page).to_not have_link 'SIGN UP',  href: new_user_registration_path
      expect(page).to_not have_link 'LOGIN',    href: new_user_session_path
      expect(page).to_not have_link 'はじめる', href: new_user_registration_path
    end
  end

  describe "サイト解説ページのテスト" do
    before do
      visit about_path
    end

    scenario "タイトルが正しく表示されていること" do
      expect(page).to have_title "ABOUT"
    end
  end
end
