class Business < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_one :menu
    has_one :schedule

    validates :name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :street, presence: true
    validates :zipcode, presence: true

end