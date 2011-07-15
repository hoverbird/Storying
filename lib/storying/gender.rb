module Storying
  module Gender
    def female?
      gender == 'woman'
    end

    def male?
      gender == 'man'
    end

    def opposite_sex
      female?? 'man' : 'woman'
    end
  end
end