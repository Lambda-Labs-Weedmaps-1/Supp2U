FactoryBot.define do
  factory :menu do
    business_id { 1 }
    name { "The Pink Door" }
  end

  factory :random_menu, class: Menu do
    business_id { 1 }
    # business_id { Faker::Number.within(range: 1..10)}
    name { Faker::Restaurant.name }
  end
end