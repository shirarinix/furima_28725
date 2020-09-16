FactoryBot.define do
  factory :purchase_address do
    transient do
      person { Gimei.name }
    end
    token                { Faker::Device.serial }
    post_code            { '123-4567' }
    prefecture_id        { Faker::Number.within(range: 1..10) }
    city                 { Gimei.city.kanji }
    address              { Gimei.town.kanji }
    building_name        { Faker::Address.building_number }
    phone_number         { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end
