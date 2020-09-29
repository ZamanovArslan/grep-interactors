require "optparse"
require "grep_interactors"

module GrepInteractors
  class Cli
    def self.call(args, out = STDOUT)
      OptionParser.new do |opts|
        opts.on("-r", "--regexp", "Use regexp to search entries") do
          GrepInteractors.container.register("string_matcher", ::StringMatcher::Regex)
        end

        opts.on_tail("-v", "--version", "Print version number") do
          out << "Grep Interactors #{GrepInteractors::VERSION}\n"
          exit
        end

        opts.on_tail("-h", "--help", "Print this help") do
          out << "Search entries in interactors chain calls \n\n"
          out << opts
          out << "\nCreated and maintained by Arslan Zamanov, available under the MIT License.\n"
          out << "Report bugs and contribute at https://github.com/ZamanovArslan/grep-interactors\n"
          exit
        end
      end.parse!(args)

      GrepInteractors.container.register("string_matcher", ::StringMatcher::Default) unless GrepInteractors.container.key?("string_matcher")

      if args[0..3].empty?
        out << "Args should be defined\n"
        return false
      end

      out << GrepInteractors.call(args[0], args[1], args[2]).join("\n")
      out << "\n"

      exit 0
    end
  end
end