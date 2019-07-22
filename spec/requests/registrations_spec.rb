require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "GET #new" do
    it "リクエストが成功すること" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    let(:tom) { create(:tom) }

    before do
      sign_in tom
    end

    it "リクエストが成功すること" do
      get edit_user_registration_path
      expect(response).to have_http_status(200)
    end

    it 'ユーザー名が表示されていること' do
      get edit_user_registration_path
      expect(response.body).to include 'tom'
    end

    it 'メールアドレスが表示されていること' do
      get edit_user_registration_path
      expect(response.body).to include 'tom@example.com'
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
  #     post user_registration_path
  #     expect(response.status).to eq 302
  #   end
  #
  #   it 'ユーザーが削除されること' do
  #     expect do
  #       post user_registration_path
  #     end.to change(User, :count).by(-1)
  #   end
  #
  #   it 'ユーザー一覧にリダイレクトすること' do
  #     post user_registration_path
  #     expect(response).to redirect_to(root_path)
  #   end
  # end
end
