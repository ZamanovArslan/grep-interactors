require "active_support"
require "byebug"
require "pathname"

class Parser
  attr_reader :interactors_path, :file_path

  def initialize(interactors_path, file_path)
    @interactors_path = interactors_path
    @file_path = file_path
  end

  def file_paths
    recursive_parse_file_paths([file_path])
  end

  def recursive_parse_file_paths(file_paths)
    return [] if file_paths.empty?

    new_file_paths = parse_files_paths parse_interactors file_paths[0]
    new_file_paths + recursive_parse_file_paths(file_paths[1..-1]) + recursive_parse_file_paths(new_file_paths)
  end

  def parse_files_paths(class_names)
    class_names.map {|class_name| get_file_path_by_class(class_name) }
  end

  def parse_interactors(file_path)
    interactors = File.read(file_path).scan(/[A-Z][a-z]*[::[A-Z][a-z]*]*/).filter_map do |constant|
      get_full_class_name(constant, file_path)
    end
    current_class = get_class_name_by_path(file_path)

    interactors - [current_class]
  end

  def get_full_class_name(constant, file_path)
    return constant if Pathname.new(get_file_path_by_class(constant)).exist?

    current_module = get_class_name_by_path(file_path).split("::")[0..-2].join("::")
    full_class_name = "#{current_module}::#{constant}"

    full_class_name if Pathname.new(get_file_path_by_class(full_class_name)).exist?
  end

  def get_class_name_by_path(path)
    ActiveSupport::Inflector.camelize(path.gsub(interactors_path, "").gsub(".rb", ""))
  end

  def get_file_path_by_class(class_name)
    "#{interactors_path}#{ActiveSupport::Inflector.underscore(class_name)}.rb"
  end
end