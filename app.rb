require_relative "grep_in_paths"

file_paths = Parser.new(ARGV[1], ARGV[2])
GrepInPaths.call(ARGV[3], file_paths)
