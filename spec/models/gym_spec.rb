require 'rails_helper'

RSpec.describe Gym, type: :model do
  context "Gymモデルが有効な場合" do
    let(:gym) { create(:gym) }

    it "Gymモデルが有効" do
      expect(gym).to be_valid
    end

    it "備考が空欄" do
      gym.details = ""
      expect(gym).to be_valid
    end
  end

  context "Gymモデルが無効な場合" do
    let(:gym) { create(:gym) }

    it "名前が空欄" do
      gym.gym_name = ""
      expect(gym).to_not be_valid
    end

    it "名前が50文字を越える" do
      gym.gym_name = "a" * 51
      expect(gym).to_not be_valid
    end

    it "名前がユニークではない" do
      gym            = create(:gym)
      duplicate_gym  = build(:gym)
      expect(duplicate_gym).to_not be_valid
    end

    it "都道府県が空欄" do
      gym.prefecture = ""
      expect(gym).to_not be_valid
    end

    it "住所が空欄" do
      gym.address = ""
      expect(gym).to_not be_valid
    end

    it "備考が500文字以上" do
      gym.details = "a" * 501
      expect(gym).to_not be_valid
    end
  end
end
