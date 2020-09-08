require "interactor"
require "active_support"
require "byebug"

class App
  attr_reader :interactors_path, :file_path

  def initialize(interactors_path, file_path)
    @interactors_path = interactors_path
    @file_path = file_path

    require_all interactors_path
  end

  def grep_in_interactors(query)
    file_paths = parse_files_paths(parse_class_constants(parse_interactors(parse_constants)))

    file_paths.map do |file_path|
      lines = File.open(file_path).readlines

      "#{file_path}: #{lines.index {|line| line.include?(query) } + 1}"
    end
  end

  # private

  def parse_constants
    File.read(file_path).scan(/[A-Z][a-z]*[::[A-Z][a-z]*]*/)
  end

  def parse_class_constants(class_names)
    class_names.map {|class_name| ActiveSupport::Inflector.constantize(class_name) }
  end

  def parse_interactors(class_names)
    class_names.select {|class_name| interactor?(class_name) }
  end

  def parse_files_paths(klasses)
    klasses.map {|klass| get_file_path_by_class(klass) }
  end

  def interactor?(class_name)
    ActiveSupport::Inflector.constantize(class_name).include?(Interactor)
  end

  def require_all(path)
    Dir["#{path}**/*.rb"].each do |f|
      require(f)
    rescue NameError => e
    end
  end

  def get_file_path_by_class(klass)
    "#{interactors_path}/#{ActiveSupport::Inflector.underscore(klass.name)}.rb"
  end
end
