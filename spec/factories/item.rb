# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    title { Faker::Commerce.product_name }
  end
end
