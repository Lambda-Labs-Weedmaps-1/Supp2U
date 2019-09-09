require 'faker'
# It is highly recommended that you have one factory for each class that provides the simplest set of attributes necessary to create an instance of that class. If you're creating ActiveRecord objects, that means that you should only provide attributes that are required through validations and that do not have defaults. Other factories can be created through inheritance to cover common scenarios for each class.
# ----------------------------------------------------------------------------
# default call to factory
# build(:user) => Returns instance w/o saving
# create(:user) => Returns saved instance
# -------------------------------------------
# user1 = create(:user)
# user1 attributes will be username: PickleRiccckkkk, email: blipsnchitz@example.com, #password: wubbalubbadubdub
# override default arguments
# user2 = create(:user, username: "PickleRiccckkkk", email: "bob@gmail.com")
# user2 attributes will be username: PickleRiccckkkk, email: bob@gmail.com, #password: blah
# -----------------------------------------------------------------------------

FactoryBot.define do
	factory :user do
		username { 'PickleRiccckkkk' }
		email { 'blipsnchitz@example.com' }
		password { 'wubbalubbadubdub' }
  end

  factory :random_user, class: User do
    username { Faker::Name.name }
    email { Faker::Internet.safe_email }
    # password { Faker::Password.password}
    
  end
end
