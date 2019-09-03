class Review < ApplicationRecord
    belongs_to :customer

    validates :customer_id, presence: true
    validates :business_id, presence: true
    validates :review, presence: true
    validates :rating, presence: true
end