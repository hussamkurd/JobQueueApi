require 'rails_helper'

RSpec.describe TokensController, type: :controller do
  describe 'Get #index' do
    before do
      get :index
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a new token' do
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key('token')
      expect(json_response['token']).to be_present
    end

    it 'creates a new Token record' do
      expect(Token.count).to eq(1)
    end
  end
end
