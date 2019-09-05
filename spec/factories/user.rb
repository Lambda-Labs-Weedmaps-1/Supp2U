# It is highly recommended that you have one factory for each class that provides the simplest set of attributes necessary to create an instance of that class. If you're creating ActiveRecord objects, that means that you should only provide attributes that are required through validations and that do not have defaults. Other factories can be created through inheritance to cover common scenarios for each class.
# ----------------------------------------------------------------------------
# default call to factory
# user1 = create(:user)
#user1 attributes will be username: Joe, email: joe@gmail.com, #password: blah
# override default arguments
# user2 = create(:user, username: "Bob", email: "bob@gmail.com")
#user2 attributes will be username: Bob, email: bob@gmail.com, #password: blah
# -----------------------------------------------------------------------------
# describe User do
# context 'validations' do
#   before { FactoryBot.build(:user) }

#   it do
#     should validate_uniqueness_of(:username).
#       scoped_to(:account_id).
#       case_insensitive
#   end
# end
# end

FactoryBot.define do
	factory :user do
    username { "PickleRiccckkkk" }
		email { "blipsnchitz@example.com" }
		password { "wubbalubbadubdub" }
	end
end
