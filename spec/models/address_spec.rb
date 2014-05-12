require 'spec_helper'

describe Address do
  it "should have a vaild factory" do 
    FactoryGirl.create(:address).should be_valid
  end

  before do 
    p = FactoryGirl.create(:person)
  end  

  it "must have a street" do
    FactoryGirl.build(:address, :street => nil).should_not be_valid
  end

  it "must have a city" do
    FactoryGirl.build(:address, :city => nil).should_not be_valid
  end 

  it "must have a zipcode" do
    FactoryGirl.build(:address, :zipcode => nil).should_not be_valid
  end

  it "isn't required to have a country" do
    FactoryGirl.build(:address, :country => nil).should be_valid
  end

  it "should have country default to 'USA' if left blank" do
    address = FactoryGirl.build(:address, :country => nil)
    address.save
    address.country.should == "USA"
  end
end
