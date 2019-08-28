class User < ApplicationRecord
    has_secure_password

    has_one :customer
    has_one :business

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def self.from_token_payload payload
        puts payload['sub']
        payload['sub']
    end
end