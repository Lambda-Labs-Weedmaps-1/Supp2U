require "rails_helper"

RSpec.describe User, :type => :model do 
  before(:all) do
    # @user1 = create(:user)
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