require "active_support"
require "dry/auto_inject"
require "containers/base"

module GrepInteractors
  def self.call(interactors_path, file_path, query)
    file_paths = Parser.new(interactors_path, file_path).file_paths

    GrepInPaths.new.call(query, file_paths)
  end

  def self.container
    @@container ||= Containers::Base
  end

  Import = Dry::AutoInject(container)
end

require "grep_interactors/parser"
require "grep_interactors/cli"
require "grep_interactors/grep_in_paths"
require "grep_interactors/version"
require "string_matcher/default"
require "string_matcher/regex"
