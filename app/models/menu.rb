class Menu < ApplicationRecord
	include PgSearch::Model

	belongs_to :business
	has_many :items
end
