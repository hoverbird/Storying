module Storying
  module Views
    class Wondermark < StoryView

      def self.pass_through(*methods)
        methods.each do |m|
          define_method m do
            wondermarks[m.to_s].random
          end
        end
      end

      pass_through :location_adj, :location_noun, :protagonist, :discovery,
                   :adversary, :assistant, :inventory, :conflict, :title_adj, :title_noun

      # def wonda
      #   wondermarks["title_adj"].random.inspect
      # end
    end
  end
end