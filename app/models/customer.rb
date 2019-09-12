class Customer < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :orders
    has_one_attached :image
    has_one :cart
end