require 'rails_helper'

RSpec.describe "Passwords", type: :request do
  describe "GET #edit" do
    it "リクエストが成功すること" do
      get edit_user_password_path
      expect(response).to have_http_status(302)
    end
  end
end
