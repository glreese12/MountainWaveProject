require 'spec_helper'

describe Icon do
  before(:each) do
    #setup goes here
  end

  after(:each) do
    #teardown goes here
  end
  
  context "Attribute Verification" do
    it "ensures required attributes are set" do
      icon = Event.new 
      assert icon.invalid? 
      assert icon.errors[:name].any?
    end    
  end
end
