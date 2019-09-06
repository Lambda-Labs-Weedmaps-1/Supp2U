FactoryBot.define do 
  factory :customer do
    user_id { 1 }
    custname { "Bob Ross" }
    # add image url
    image {}
  end
end