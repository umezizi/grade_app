require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /about" do
    it "リクエストが成功すること" do
      get about_path
      expect(response).to have_http_status(200)
    end
  end
end
