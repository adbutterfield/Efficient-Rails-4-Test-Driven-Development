# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :address do |f|
    f.street { Faker::Address.street_address(include_secondary = false) }
    f.city { Faker::Address.city }
    f.zipcode { Faker::Address.zip_code }
    f.country { Faker::Address.country }
    f.state { Faker::Address.state_abbr }
  end
end
