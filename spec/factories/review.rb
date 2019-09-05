FactoryBot.define do 
  factory :review do 
    customer_id { 2 }
    business_id { 3 }
    review { "It was decent" }
    rating { 2 }
  end
end