class Item < ApplicationRecord
	include PgSearch::Model
	# pg_search_scope :search_by_item_name, against: %i[item_name]

	belongs_to :menu
	has_one_attached :image
	has_many :order_items

	validates :item_name, presence: true
	validates :price, presence: true
end
