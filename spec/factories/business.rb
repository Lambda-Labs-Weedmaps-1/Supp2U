FactoryBot.define do
  factory :business do
    user_id { 1 }
    name { "Angelo's Taverna" }
    city { "Denver" }
    state { "CO" }
    street { "620 E 6th Ave" }
    zipcode { 80_203 }
  end
end