require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Postモデルが有効な場合" do
    let(:post) { create(:post) }

    it "Postモデルが有効" do
      expect(post).to be_valid
    end
  end

  context "Postモデルが無効な場合" do
    let(:post) { create(:post) }

    it "コメントが空欄" do
      post.comment = ""
      expect(post).to_not be_valid
    end

    it "コメントが150文字を越える" do
      post.comment = "a" * 151
      expect(post).to_not be_valid
    end
  end
end
