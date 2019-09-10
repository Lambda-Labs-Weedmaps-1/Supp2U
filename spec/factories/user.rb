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
# Persisting to the database slows down tests. Whenever possible, favor using FactoryGirl’s build_stubbed over create. build_stubbed will generate the object in memory and save you from having to write to the disk. If you are testing something in which you have to query for the object (like User.where(admin: true)), your database will be expecting to find it in the database, meaning you must use create.
FactoryBot.define do
	factory :user do
		username { 'PickleRiccckkkk' }
		email { 'blipsnchitz@example.com' }
		password { 'wubbalubbadubdub' }
  end

  factory
  
  factory :random_user, class: User do
    username { Faker::Name.name }
    email { Faker::Internet.safe_email }
    # password { Faker::Password.password}
  end
end
