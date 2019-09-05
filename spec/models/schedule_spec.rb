require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before(:all) do
    @user1 = create(:user)
    @business1 = create(:business)
  end

  describe "associations" do
    it { should belong_to(:business).class_name('Business') }
  end
end
