# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :person do |f|
    f.first_name { Faker::Name.first_name }
    f.middle_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
  end
end
