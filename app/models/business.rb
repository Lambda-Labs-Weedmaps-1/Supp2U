class Business < ApplicationRecord
    belongs_to :user
    has_one :menu

    validates :name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :street, presence: true
    validates :zipcode, presence: true

end