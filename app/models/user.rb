class User < ApplicationRecord
    has_one :customer
    has_one :business

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

end