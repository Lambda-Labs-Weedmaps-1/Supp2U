require "rails_helper"

RSpec.describe Menu, :type => :model do 
  describe 'associations' do
    it { should belong_to(:business).class_name('Business') } 
    it { should have_many(:items) }
  end
end