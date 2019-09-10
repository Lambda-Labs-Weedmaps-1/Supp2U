class Review < ApplicationRecord
    belongs_to :customer
    belongs_to :business
    has_one_attached :image

    validates :customer_id, presence: true
    validates :business_id, presence: true
    validates :review, presence: true
    validates :rating, presence: true
end