class Order < ApplicationRecord
    has_many :order_items
    has_many  :items, through: :order_products
    belongs_to :customer
    belongs_to :business
end