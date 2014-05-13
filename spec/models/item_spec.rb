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
end
