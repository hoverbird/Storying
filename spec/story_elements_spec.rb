require 'spec_helper'

class TestAllElements
  include Storying::StoryElements
end

class TestRandomElements < TestAllElements        
  has_random_story_element :last_name
end

class TestUniqueRandomElements < TestAllElements        
  has_random_story_element :last_name, :unique => true
end


describe "Story Elements inclusion" do  
  subject { TestAllElements.new }
  before { @total_last_names = subject.last_names.size }
  
  specify { subject.characteristics.should be_kind_of Array }
    
  it "should return the same array on each get" do
    subject.last_names.object_id.should == subject.last_names.object_id
  end

  shared_examples_for "having a random story element" do
    it "once set, is always the same" do
      subject.instance_variable_get(:@last_name).should == nil
      subject.last_name.should == subject.last_name
      subject.instance_variable_get(:@last_name).should == subject.last_name
    end
  
    it "has no element accessors that are undeclared" do
      subject.should respond_to(:last_name)
      subject.should_not respond_to(:characteristic)
    end
  end

  context "has_random_story_element" do
    subject { TestRandomElements.new }
    
    it "should return random element from collection without altering it" do
      subject.last_names.size.should == @total_last_names
      subject.last_name.should be_kind_of String
    end
    
    it_should_behave_like "having a random story element"
  end

  context "has_random_story_element with :unique => true" do
    subject { TestUniqueRandomElements.new }

    it "should pop the element out of the collection once accessed" do
      subject.last_names.size.should == @total_last_names
      subject.last_name.should be_kind_of String
      subject.last_names.size.should == @total_last_names - 1
    end
    
    it_should_behave_like "having a random story element"
  end
end