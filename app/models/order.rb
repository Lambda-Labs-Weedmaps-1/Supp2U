class Order < ApplicationRecord
    has_many :order_items
    has_many  :items, through: :order_products
    belongs_to :customer
    belongs_to :business

    validates :customer_id, presence: true
    validates :business_id, presence: true
    validates :status, presence: true
end