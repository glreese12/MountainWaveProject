require 'spec_helper'

describe PointOfInterest do
  
  before(:each) do
    #setup goes here
  end

  after(:each) do
    #teardown goes here
  end
  
  context "Attribute Verification" do
    it "ensures required attributes are set" do
      poi = PointOfInterest.new 
      assert poi.invalid? 
      assert poi.errors[:name].any?
      assert poi.errors[:description].any? 
      assert poi.errors[:latitude].any?
      assert poi.errors[:longitude].any?
      assert poi.errors[:event_id].any?
    end
        
  end
  
  
end