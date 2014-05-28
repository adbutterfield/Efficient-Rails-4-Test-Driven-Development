require 'spec_helper'

describe Customer do
  it "should have a valid factory" do
    FactoryGirl.create(:customer, :is_customer).should be_valid
  end

  it "should be a type of person" do
    FactoryGirl.create(:customer, :is_customer).should be_kind_of(Person)
  end

  it "can have many orders" do
    Customer.new.should respond_to(:orders)
    Customer.new.should respond_to(:items_orders)
  end

  context "given a customer" do
    it "should retrieve all the items they bought" do
      customer = FactoryGirl.create(:customer, :is_customer)
      2.times do
        FactoryGirl.create(:order, :customer_id => customer.id)
      end
      customer.ordered_items.count.should == 4
    end
  end

  context "loyalty program" do
    it "should retrieve the customers who bought 2 or more items within last 90 days" do
      two_items_one_order = FactoryGirl.create(:customer)
      one_item_two_orders = FactoryGirl.create(:customer)
      one_item_one_order = FactoryGirl.create(:customer)
      two_items_over_90_days = FactoryGirl.create(:customer)

      item1 = FactoryGirl.create(:item)
      item2 = FactoryGirl.create(:item)

      FactoryGirl.create(:order, :customer => two_items_one_order, :items => [item1, item2])
      FactoryGirl.create(:order, :customer => one_item_two_orders, :items => [item1])
      FactoryGirl.create(:order, :customer => one_item_two_orders, :items => [item2])
      FactoryGirl.create(:order, :customer => one_item_one_order, :items => [item1])
      FactoryGirl.create(:order, :customer => two_items_over_90_days, :items => [item1, item2], :created_at => 91.days.ago)

      Customer.loyalty_program.should == [two_items_one_order, one_item_two_orders]
    end
  end
end
