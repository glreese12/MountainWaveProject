require 'spec_helper'

describe Event do
  
  before(:each) do
    #setup goes here
  end

  after(:each) do
    #teardown goes here
  end
  
  context "Attribute Verification" do
    it "ensures required attributes are set" do
      event = Event.new 
      assert event.invalid? 
      assert event.errors[:name].any?
      assert event.errors[:description].any? 
      assert event.errors[:latitude].any? 
      assert event.errors[:longitude].any?
      assert event.errors[:event_date].any?
      assert event.errors[:event_label].any?
      assert event.errors[:icon].any?      
    end
    
    it "correctly validates the GLIDE number" do
      event = Event.new
      assert event.invalid?
      event.glide_number = "WF-2012-000001-CHL"
      event.should have(0).error_on(:glide_number)
      event.glide_number = "WF-A012-000001-CHL"
      event.should have(1).error_on(:glide_number)
    end  
    
    it "only returns events from the last 365 days" do
  
    end
      
  end
  
end