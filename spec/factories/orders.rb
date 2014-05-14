# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer
    items {
      2.times.map do
       FactoryGirl.create(:item)
      end
     }
  end
end
