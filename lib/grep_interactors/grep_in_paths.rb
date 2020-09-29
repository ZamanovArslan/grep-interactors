module GrepInteractors
  class GrepInPaths
    include Import["string_matcher"]

    def call(query, file_paths)
      file_paths.reduce([]) do |accum, file_path|
        lines = File.open(file_path).readlines

        accum + lines.each_with_index.map do |line, index|
          ("#{file_path}:#{index + 1}") if string_matcher.match?(line, query)
        end.compact
      end.flatten
    end
  end
end
