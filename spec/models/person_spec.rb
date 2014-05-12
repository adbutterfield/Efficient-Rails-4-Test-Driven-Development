require 'spec_helper'

describe Person do
  it "should have a vaild factory" do
    FactoryGirl.create(:person).should be_valid
  end

  it "must have a first_name" do
    FactoryGirl.build(:person, :first_name => nil).should_not be_valid
  end

  it "must have a last_name" do
    FactoryGirl.build(:person, :last_name => nil).should_not be_valid
  end

  it "isn't required to have a middle name" do 
    FactoryGirl.build(:person, :middle_name => nil).should be_valid
    # p.errors[:middle_name].should_not include("can't be blank")
    # p.errors.on(:middle_name).should_not be_nil

  end

  it "can have a middle name" do 
    FactoryGirl.create(:person).should be_valid
  end

  it "can construct full name from first_name and last_name if middle_name is nil" do
    person = FactoryGirl.build(:person, :middle_name => nil)
    person.full_name.should == "#{person.first_name} #{person.last_name}"
  end

  it "can construct full name from all three names" do
    person = FactoryGirl.create(:person)
    person.full_name.should == "#{person.first_name} #{person.middle_name} #{person.last_name}"
  end

  it "saves correctly" do
    person = FactoryGirl.create(:person, :first_name => "first", :middle_name => nil, :last_name => "last")
    Person.count.should == 1
    person.first_name.should == "first"
    person.middle_name.should == nil
    person.last_name.should == "last"
  end

  it "can have many addresses" do
    person = FactoryGirl.create(:person)
    2.times do 
      FactoryGirl.create(:address, :person_id => person.id)
    end
    person.addresses.count.should == 2
  end
end
