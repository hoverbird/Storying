require 'spec_helper'

describe "Story Elements inclusion" do
  class TestClass
    include Storying::StoryElements

    has_randomized_story_element :characteristic, :last_name
  end

  let(:test_object) {TestClass.new}

  specify {test_object.characteristic.should be_kind_of String}
  specify {test_object.characteristics.should be_kind_of Array}

  it "should pop from the collection by default" do
    original_size = test_object.characteristics.size
    puts test_object.characteristics
    test_object.characteristic
    test_object.characteristic.size.should == original_size - 1
  end

end