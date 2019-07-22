require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    context 'ユーザーが存在する場合' do
      let(:tom) { create(:tom) }

      before do
        sign_in tom
      end

      it "リクエストが成功すること" do
        get user_url tom.id
        expect(response).to have_http_status(200)
      end

      it 'ユーザー名が表示されていること' do
          get user_url tom.id
          expect(response.body).to include 'tom'
      end
    end
  end
end
