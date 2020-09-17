require_relative "grep_in_paths"
require_relative "parser"

class GrepInteractors
  def self.call(interactors_path, file_path, query)
    file_paths = Parser.new(interactors_path, file_path).file_paths

    GrepInPaths.call(query, file_paths)
  end
end