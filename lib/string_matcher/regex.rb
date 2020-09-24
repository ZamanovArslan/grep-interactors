module StringMatcher
  class Regex
    def self.match?(string, regexp)
      string.match? Regexp.new regexp
    end
  end
end