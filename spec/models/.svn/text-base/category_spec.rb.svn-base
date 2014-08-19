require 'spec_helper'

describe Category do
  
  before(:each) do
    #setup goes here
  end

  after(:each) do
    #teardown goes here
  end
  
  context "Attribute Verification" do
    it "ensures required attributes are set" do
      category = Category.new 
      assert category.invalid? 
      assert category.errors[:name].any?
      assert category.errors[:description].any? 
    end
        
  end
  
  
end