class GrepInPaths
  def self.call(query, file_paths)
    file_paths.map do |file_path|
      lines = File.open(file_path).readlines

      "#{file_path}: #{lines.index {|line| line.include?(query) } + 1}"
    end
  end
end
