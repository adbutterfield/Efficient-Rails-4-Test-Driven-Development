require 'spec_helper'

describe Customer do
  it "should have a valid factory" do
    FactoryGirl.create(:customer).should be_valid
  end

  it "should be a type of person" do
    FactoryGirl.create(:customer).should be_kind_of(Person)
  end
end
