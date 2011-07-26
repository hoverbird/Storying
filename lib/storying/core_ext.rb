class Array
  unless method_defined? :extract_options!
    def extract_options!
      if last.is_a? Hash
        pop
      else
        {}
      end
    end
  end
end