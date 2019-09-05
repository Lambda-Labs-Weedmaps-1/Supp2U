require "rails_helper"
# default call to factory
# user1 = create(:user)
# user1 attributes will be username: Joe, email: joe@gmail.com, #password: blah
# override default arguments
# user2 = create(:user, username: "Bob", email: "bob@gmail.com")
# user2 attributes will be username: Bob, email: bob@gmail.com, #password: blah

RSpec.describe User, :type => :model do 
  before(:all) do
    @user1 = create(:user)
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