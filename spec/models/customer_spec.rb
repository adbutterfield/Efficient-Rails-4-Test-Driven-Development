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
  end

  context "given a customer" do
    it "should be able to find all the items they bought" do
      customer = FactoryGirl.create(:customer, :is_customer)
      2.times do
        FactoryGirl.create(:order, :customer_id => customer.id)
      end
      customer.ordered_items.count.should == 4
    end
  end
end
