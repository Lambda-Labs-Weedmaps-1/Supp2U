class Customer < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :orders
    has_many :carts

    has_one_attached :image
    
end