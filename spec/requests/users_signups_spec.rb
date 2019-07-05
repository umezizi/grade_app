require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /sign_up" do
    it "リクエストが成功すること" do
      get users_new_path
      expect(response).to have_http_status(200)
    end
  end
end
