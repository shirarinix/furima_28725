FactoryBot.define do
  factory :item do
    image            { Faker::Avatar.image }
    name             { Faker::Internet.domain_word }
    introduction     { Faker::Lorem.paragraph(sentence_count = １) }
    category_id      { Faker::Number.within(range: 1..10) }
    product_id       { Faker::Number.within(range: 1..10) }
    delivery_id      { Faker::Number.within(range: 1..10) }
    prefecture_id    { Faker::Number.within(range: 1..10) }
    preparation_id   { Faker::Number.within(range: 1..10) }
    selling_price    { Faker::Number.within(range: 300..9999999 }
  end
end
