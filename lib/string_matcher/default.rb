module StringMatcher
  class Default
    def self.match?(string, regexp)
      string.include? regexp
    end
  end
end