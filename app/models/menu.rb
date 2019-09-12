class Menu < ApplicationRecord
	belongs_to :business
	has_many :items
end
