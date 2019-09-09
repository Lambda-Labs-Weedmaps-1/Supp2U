class Cart < ApplicationRecord
    
    belongs_to :customer
    belongs_to :business
    # has_many :items

end
