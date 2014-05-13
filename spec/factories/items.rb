# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :item do |i| 
    i.name { Faker::Commerce.product_name }
    i.description { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3) }
    i.price { Faker::Commerce.price }
  end
end
