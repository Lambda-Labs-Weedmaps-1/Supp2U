require 'rails_helper'

RSpec.describe Review, type: :model do
  before(:all) do
    # @user1 = create(:user)
    # built_users = build_list(:user, 10)
    # built_customers = build_list(:customer, 5)
    # @customer1 = create(:customer)
    # built_businesses = build_list(:business, 3)
    # @review1 = create(:review)
  end

  describe "associations" do
    it { should belong_to(:customer).class_name('Customer') }
    it { should belong_to(:business).class_name('Business') }
  end

  describe "validations" do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:business_id) }
    it { should validate_presence_of(:review) }
    it { should validate_presence_of(:rating) }
  end
end
