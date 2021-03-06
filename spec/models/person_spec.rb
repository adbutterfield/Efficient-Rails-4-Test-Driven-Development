require 'spec_helper'

describe Person do
  it "should have a vaild factory" do
    FactoryGirl.create(:person).should be_valid
  end

  describe "Validations" do
    [:first_name, :last_name].each do |attr|
      it "must have a #{attr}" do
        FactoryGirl.build(:person, attr => nil).should_not be_valid
      end
    end

    it "isn't required to have a middle name" do 
      person = FactoryGirl.build(:person, :middle_name => nil)
      person.should be_valid
      person.errors[:middle_name].should_not be_any
    end

    it "can have a middle name" do 
      FactoryGirl.create(:person).should be_valid
    end
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
    person.type.should == nil
  end

  describe "Associations" do
    it "can have many addresses" do
      person = FactoryGirl.create(:person)
      person.should respond_to(:addresses)
      2.times do
        FactoryGirl.create(:address, :person_id => person.id)
      end
      person.addresses.count.should == 2
    end

    it "can have many messages" do
      person = FactoryGirl.create(:person)
      person.should respond_to(:messages)
      2.times do
        FactoryGirl.create(:message, :recipient_id => person.id)
      end
      person.messages.count.should == 2
    end
  end

  it "should retreive all the un-read messages" do
    person = FactoryGirl.create(:person)
    FactoryGirl.create(:message, :recipient_id => person.id)
    FactoryGirl.create(:message, :recipient_id => person.id, :read_at => Time.now)
    person.messages.count.should == 2
    person.messages.unread_messages.count.should == 1
  end

  context "search" do
    it "should find a person by partial match of first or last name" do
      john = FactoryGirl.create(:person, :first_name => "John", :last_name => "Smith")
      peter = FactoryGirl.create(:person, :first_name => "Peter", :last_name => "Johnson")
      sally = FactoryGirl.create(:person, :first_name => "Sally", :last_name => "Smith")

      Person.order(id: :asc).should == [john, peter, sally]
      Person.find_by_names_starting_with("Joh").should == [peter, john]
    end
  end
end
