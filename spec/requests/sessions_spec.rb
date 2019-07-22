require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET #new" do
    it "リクエストが成功すること" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  # describe 'DELETE #destroy' do
  #   let(:user) { create(:user) }
  #
  #   before do
  #     sign_in user
  #   end
  #
  #   it 'リクエストが成功すること' do
  #     post destroy_user_session_path
  #     expect(response.status).to eq 302
  #   end
  #
  #   it 'ユーザーが削除されること' do
  #     post destroy_user_session_path
  #     expect(true).to be user_signed_in?
  #   end
  #
  #   it 'ユーザー一覧にリダイレクトすること' do
  #     post destroy_user_session_path
  #     expect(response).to redirect_to(root_path)
  #   end
  # end
end
