require "rails_helper"

RSpec.describe Menu, :type => :model do 
  before(:all) do
    # @user1 = create(:user)
    # @business1 = create(:business)
    # @menu1 = create(:menu)
  end

  describe 'associations' do
    it { should belong_to(:business).class_name('Business') } 
    it { should have_many(:items) }
  end
end