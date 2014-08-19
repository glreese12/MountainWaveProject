require 'spec_helper'

describe Subscriber do
  
  before(:each) do
    #setup goes here
  end

  after(:each) do
    #teardown goes here
  end
  
  context "Attribute Verification" do
    it "ensures required attributes are set" do
      subscriber = Subscriber.new 
      assert subscriber.invalid? 
      assert subscriber.errors[:first_name].any?
      assert subscriber.errors[:last_name].any? 
      assert subscriber.errors[:email].any?
    end
        
  end
  
  
end