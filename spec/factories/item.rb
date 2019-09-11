FactoryBot.define do
  factory :item do
    menu_id { 1 }
    item_name { "Steak and Eggs" }
    price { 7.99 }
  end

  factory :random_item, class: Item do
    menu_id { Faker::Number.within(range: 1..1000) }
    item_name { Faker::Food.dish }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end