FactoryBot.define do
  factory :user do
    username { Faker::Alphanumeric.alphanumeric(number: 20) }
    email { Faker::Internet.email }
  end
end
