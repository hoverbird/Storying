require 'spec_helper'

describe Storying::Hero do
  let(:hero) { Storying::Hero.new }

  context "when new" do

    it "has a name and full_name" do
      hero.name.should_not be_nil
      hero.name.should_not be_empty

      hero.full_name.should match /#{hero.name}/
    end

    it "has a default string representation as its first name" do
      hero.to_s.should equal(hero.name)
    end

    it "has a gender" do
      ['man', 'woman'].should include hero.gender
    end

    it "has a job" do
      hero.job.should_not be_nil
      hero.job.should_not be_empty
    end

    it "has a goal" do
      hero.goal.should_not be_nil
      hero.goal.should_not be_empty
    end

    it "has attributes that are random initially, consistent thereafter" do
      hero.goal.should equal hero.goal
      hero.gender.should equal hero.gender
      hero.job.should equal hero.job
    end

    it "has access to random story elements" do
      hero.characteristics.should be_kind_of Array
    end

    it "does not have random attributes that make no sense (i.e. setting stuff)"

  end

  context "when new with passed attributes" do
    it "is initialized with those passed in, rather than random ones" do
      hero = Storying::Hero.new(:gender => 'intersexed', :job => 'carnival ride attendant')
      hero.gender.should == 'intersexed'
      hero.job.should == 'carnival ride attendant'
    end
  end

end