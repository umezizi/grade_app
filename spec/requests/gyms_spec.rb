require 'rails_helper'

RSpec.describe "Gyms", type: :request do
  describe "GET /" do
    it "リクエストが成功すること" do
      get root_path
      expect(response).to have_http_status(200)
    end

    # it 'ジム名が表示されていること' do
    #   get root_path
    #   expect(response.body).to include "ボルコム"
    #   expect(response.body).to include "ロッキー"
    # end
  end
end
