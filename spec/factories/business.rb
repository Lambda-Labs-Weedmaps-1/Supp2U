FactoryBot.define do
  factory :business do
    user_id { 1 }
    name { "Angelo's Taverna" }
    city { "Denver" }
    state { "CO" }
    street { "620 E 6th Ave" }
    zipcode { 80_203 }
    # add image url
    image {}
  end
  factory :random_business, class: Business do
    user_id { 1 }
    name { Faker::Name.name }
    street { Faker::Address.street_address }
    zipcode {Faker::Company.sic_code}
    city { Faker::Address.city  }
    state { Faker::Address.state }
  end
end