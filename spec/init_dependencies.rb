def self.container
  @@container ||= Containers::Base
end

container.register("string_matcher", ::StringMatcher::Default)
Import = Dry::AutoInject(container)
