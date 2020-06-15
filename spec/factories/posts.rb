# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'MyString' }
    description { 'MyText' }
    user { nil }
  end
end
