module CharacterAttributes
  def initialize(story)
    @story = story
  end

  def gender
    @gender ||= ['female', 'male'].random
  end

  def gendered_possesive_pronoun
    gender == 'female' ? 'her' : 'him'
  end

  def characteristic
    @characteristic ||= Storying.characteristics.random
  end

  def relationship_to_setting
    @relationship_to_setting ||= [Storying.relationships_to_setting.random, @story.setting].join(' ')
  end
end
