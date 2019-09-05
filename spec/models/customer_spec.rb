require "rails_helper"

RSpec.describe Customer, :type => :model do 
  before(:all) do
    @user2 = create(:user)
    # @user2 = create(:user)
    # @customer1 = create(:customer)
    # @customer2 = create(:customer)
  end

  describe 'associations' do
    it { should belong_to(:user).class_name('User') } 
    it { should have_many(:reviews).class_name('Review') }
    it { should have_one_attached(:image) }
  end

  # Todo add once Model has validations attached
  # describe 'validations' do
  #   it { should validate_presence_of(:email) }
  #   it { should validate_uniqueness_of(:email) }
  # end
end