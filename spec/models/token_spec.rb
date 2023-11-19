require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'token generation' do
    it 'generates a unique authentication token' do
      token = create(:token)
      expect(token.authentication_token).to be_present
    end

    it 'generates a different token for each token' do
      token1 = create(:token)
      token2 = create(:token)
      expect(token1.authentication_token).not_to eq(token2.authentication_token)
    end
  end

end
