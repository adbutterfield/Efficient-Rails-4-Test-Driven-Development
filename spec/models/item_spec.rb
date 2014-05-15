require 'spec_helper'

describe Item do
  it "should have a valid factory" do
    FactoryGirl.create(:item).should be_valid
  end

  describe "Validations" do
    [:name, :price].each do |attr|
      it "must have a #{attr}" do
        FactoryGirl.build(:item, attr => nil).should_not be_valid
      end
    end
  end

  it "can retreive a list of items ordered by number sold" do
    item1 = FactoryGirl.create(:item)
    item2 = FactoryGirl.create(:item)
    item3 = FactoryGirl.create(:item)
    FactoryGirl.create(:order, :items => [item2, item3, item1])
    FactoryGirl.create(:order, :items => [item2, item3])
    FactoryGirl.create(:order, :items => [item2])

    Item.by_popularity.should == [item2, item3, item1]
  end
end
