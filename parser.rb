require "interactor"
require "active_support"
require "byebug"

class Parser
  attr_reader :interactors_path, :file_path

  def initialize(interactors_path, file_path)
    @interactors_path = interactors_path
    @file_path = file_path

    require_all interactors_path
  end

  def recursive_parse_file_paths(file_paths)
    return [] if file_paths.empty?

    new_file_paths = parse_files_paths(parse_interactors(parse_constants(file_paths[0])))
    new_file_paths + recursive_parse_file_paths(new_file_paths - file_paths)
  end

  def parse_files_paths(class_names)
    class_names.map {|class_name| get_file_path_by_class(class_name) }
  end

  def get_file_path_by_class(class_name)
    "#{interactors_path}#{ActiveSupport::Inflector.underscore(class_name)}.rb"
  end

  def parse_class_constants(class_names)
    class_names.map {|class_name| ActiveSupport::Inflector.constantize(class_name) }
  end

  def parse_interactors(class_names)
    class_names.select {|class_name| interactor?(class_name) }
  end

  def interactor?(class_name)
    ActiveSupport::Inflector.constantize(class_name).include?(Interactor)
  end

  def parse_constants(file_path)
    File.read(file_path).scan(/[A-Z][a-z]*[::[A-Z][a-z]*]*/) - [get_class_name_by_path(file_path)]
  end

  def get_class_name_by_path(path)
    ActiveSupport::Inflector.camelize(path.gsub(interactors_path, "").gsub(".rb", ""))
  end

  def require_all(path)
    Dir[File.join(path, "**/*.rb")].each do |f|
      require(f)
    rescue NameError => e
    end
  end
end