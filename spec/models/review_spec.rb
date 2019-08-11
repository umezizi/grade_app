require 'rails_helper'

RSpec.describe Review, type: :model do
  context "Reviewモデルが有効な場合" do
    let(:review) { create(:review) }

    it "Reviewモデルが有効" do
      expect(review).to be_valid
    end
  end

  context "Reviewモデルが無効な場合" do
    let(:review) { create(:review) }

    it "タイトルが空欄" do
      review.title = ""
      expect(review).to_not be_valid
    end

    it "タイトルが50文字を超える" do
      review.title = "a" * 51
      expect(review).to_not be_valid
    end

    it "本文が空欄" do
      review.content = ""
      expect(review).to_not be_valid
    end

    it "本文が500文字を越える" do
      review.content = "a" * 501
      expect(review).to_not be_valid
    end
  end
end
