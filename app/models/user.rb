class User < ApplicationRecord
    has_one :customer
    has_one :business

    def self.from_token_payload payload
        puts payload['sub']
        payload['sub']
    end
end