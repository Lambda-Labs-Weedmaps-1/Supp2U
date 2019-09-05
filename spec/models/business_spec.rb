require 'rails_helper'

RSpec.describe Business, type: :model do
  before(:all) do
    @user1 = create(:user)
    @business1 = create(:business)
  end

  describe "associations" do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:reviews).through(:customers).class_name('Customer') } 
    it { should have_one(:menu).class_name('Menu') }
    it { should have_one(:schedule).class_name('Schedule') }
    it { should have_one_attached(:image) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:zipcode) }
  end
end
