require 'spec_helper'

describe Message do

  it "should have a valid factory" do 
    FactoryGirl.create(:message).should be_valid
  end

  describe "Validations" do
    [:subject, :body, :sender, :recipient].each do |attr|
      it "must have a #{attr}" do
        FactoryGirl.build(:message, attr => nil).should_not be_valid
      end
    end
  end

  describe "Associations" do
    [:sender, :recipient].each do |attr|
      it "belongs to a #{attr}" do
        FactoryGirl.build(:message).should respond_to(attr)
      end
    end

    it "can retreive a sender, which is a Person object" do
      message = FactoryGirl.create(:message)
      message.sender.should_not be_nil
      message.sender.should be_kind_of(Person)
      message.errors[:sender].should_not be_any
    end
  end

end
