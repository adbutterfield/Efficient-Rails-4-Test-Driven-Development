require 'spec_helper'

describe Address do
  it "should have a vaild factory" do 
    FactoryGirl.create(:address).should be_valid
    # can also run should be_kind_of(Address)
  end

  describe "Validations" do
    [:street, :city, :zipcode, :state].each do |attr|
      it "must have a #{attr}" do
        FactoryGirl.build(:address, attr => nil).should_not be_valid
      end
    end

    it "only accepts a :state as valid if it's two letters long" do
      FactoryGirl.build(:address, :state => "a").should_not be_valid
      FactoryGirl.build(:address, :state => "ab").should be_valid
      FactoryGirl.build(:address, :state => "abc").should_not be_valid
    end
  end

  it "isn't required to have a country" do
    FactoryGirl.build(:address, :country => nil).should be_valid
  end

  context "when country field is missing" do
    it "should default to 'USA'" do
      address = FactoryGirl.build(:address, :country => nil)
      address.save
      address.country.should == "USA"
    end
  end
end
