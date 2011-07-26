require 'spec_helper'

describe "Story Elements inclusion" do
  shared_examples_for "having a random story element" do
    it "once set, is always the same" do
      subject.instance_variable_get(:@last_name).should == nil
      subject.last_name.should == subject.last_name
      subject.instance_variable_get(:@last_name).should == subject.last_name
    end
  end
  
  class TestAllElements
    include Storying::StoryElements
  end
  before { @total_last_names = subject.last_names.size }
  subject { TestAllElements.new }
  specify { subject.characteristics.should be_kind_of Array }
  
  it "should return the same array on each get" do
    subject.last_names.object_id.should == subject.last_names.object_id
  end

  context "non-unique elements" do
    class TestRandomElements < TestAllElements        
      has_random_story_element :last_name
    end
    
    subject { TestRandomElements.new }
    
    it "should return random element from collection without altering it" do
      subject.last_names.size.should == @total_last_names
      subject.last_name.should be_kind_of String
    end
    
    it_should_behave_like "having a random story element"
  end

  context "unique elements" do
    class TestUniqueRandomElements < TestAllElements        
      has_random_story_element :last_name, :unique => true
    end
    
    subject { TestUniqueRandomElements.new }

    it "should pop from the collection when unique is true" do
      subject.last_names.size.should == @total_last_names - 1
      subject.last_name.should be_kind_of String
    end
    
    it_should_behave_like "having a random story element"
  end
  

end