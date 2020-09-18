require_relative "grep_interactors"

class Cli
  def self.call(interactors_path, file_path, query, out = STDOUT)
    out << GrepInteractors.call(interactors_path, file_path, query).join("\n")
    out << "\n"
    exit 0
  end
end
