class Item < ApplicationRecord
    belongs_to :menu

    validates :item_name, presence: true
    validates :price, presence: true
end