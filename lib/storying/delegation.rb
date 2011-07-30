module Storying
  module Delegation
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods      
      def delegate(*args)
        options = args.extract_options!
        args.each do |method|
          define_method method.to_sym do
            self.send(options[:to]).send(method)
          end
        end
      end
    end
    
  end
end