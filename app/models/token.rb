require 'securerandom'

class Token < ApplicationRecord

  before_create :generate_authentication_token

  private

  def generate_authentication_token
    begin
      self.authentication_token = SecureRandom.hex
    end while self.class.exists?(authentication_token: authentication_token)
  end
end
