require "rails_helper"

RSpec.describe User, :type => :model do 
  # FactoryBot building a 'valid user'
  # by using `subject` test will reference the object
  # subject { build(:user) }
  
  # build(:user) => Returns instance w/o saving
  # create(:user) => Returns saved instance
  context "when user is a customer" do
    # should have a custname
  end

  context "when user is a business owner" do
    # should have a business_id
  end
  
  describe 'associations' do
    it { should have_one(:customer).class_name('Customer') }
    it { should have_one(:business).class_name('Business') }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end