require 'spec_helper'

describe Address do
  it "should have a vaild factory" do 
    FactoryGirl.create(:address).should be_valid
  end

  # before do 
  #   p = FactoryGirl.create(:person)
  # end  
  context "Validations" do
    [:street, :city, :zipcode].each do |attr|
      it "must have a #{attr}" do
        FactoryGirl.build(:address, attr => nil).should_not be_valid
      end
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
