require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Userモデル" do

    context "Userモデルが有効な場合" do
      let(:user) { create(:user) }

      it "Userモデルが有効" do
        expect(user).to be_valid
      end
    end

    context "Userモデルが無効な場合" do
      let(:user) { create(:user) }

      it "名前が空欄" do
        user.name = ""
        expect(user).to_not be_valid
      end

      it "メールアドレスが空欄" do
        user.email = ""
        expect(user).to_not be_valid
      end

      it "メールアドレスに「@」が含まれていない" do
        user.email = "testsample.com"
        expect(user).to_not be_valid
      end

      it "メールアドレスがユニークではない" do
        user           = create(:tom)
        duplicate_user = build(:tom)
        expect(duplicate_user).to_not be_valid
      end

      it "パスワードが6文字未満" do
        user.password = "a" * 5
        expect(user).to_not be_valid
      end

      it "パスワードがブランク6文字" do
        user.password = "      "
        expect(user).to_not be_valid
      end

      it "パスワードが一致しない" do
        user.password_confirmation = "Dummy"
        expect(user).to_not be_valid
      end

      it "プロフィールが200文字を越える" do
        user.profile = "a" * 201
        expect(user).to_not be_valid
      end
    end
  end
end
