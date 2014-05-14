require 'spec_helper'

describe Order do
  it "should have a valid factory" do
    FactoryGirl.create(:order).should be_valid
  end

  describe "Validations" do
    it "must have a customer" do
      FactoryGirl.build(:order, :customer => nil).should_not be_valid
    end

    it "must have at least one item" do
      order = FactoryGirl.build(:order, :items => [])
      order.should_not be_valid
      order.errors[:items].should include("order must have at least one item")
    end
  end

  describe "Associations" do
    it "can have many items" do
      order = FactoryGirl.create(:order)
      order.should respond_to(:items)
      order.items.count.should == 2
    end
  end
end

# Homework

# - A customer is a person in the database

# - Given a person, be able to find all the items they bought
# - The system can retreive a list of the most ordered items
# - Loyalty program, retreive a list of customers that have ordered two or more items in the last 90 days
