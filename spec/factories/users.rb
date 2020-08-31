FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name} 
    first_name            { person.first.kanji }
    last_name             { person.first.kanji } 
    sex_kana              { person.first.katakana }
    name_kana             { person.last.katakana }
    birthday              { Faker::Date.backward }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
  end
end