class Business < ApplicationRecord
	# Todo update method name to reflect search criteria
	include PgSearch::Model
	pg_search_scope :search_by_theme,
	                against: %i[theme name], using: { tsearch: { prefix: true } }

	belongs_to :user
	has_many :reviews
	has_one :menu
	has_many :items, through: :menu

	pg_search_scope :search_menu_for_item,
	                associated_against: { items: %i[item_name menu_id] },
	                using: { tsearch: { prefix: true } }

	has_one :schedule
	has_one_attached :image

	validates :name, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :street, presence: true
	validates :zipcode, presence: true
end
