lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "grep_interactors/version"

Gem::Specification.new do |spec|
  spec.name          = "grep-interactors"
  spec.version       = GrepInteractors::VERSION
  spec.authors       = ["ArslanZamanov"]
  spec.email         = ["arslan.zamanov@flatstack.com"]

  spec.summary       = "Recursive Grep keyword in called interactors inside requested interactor"
  spec.description   = "Gem, which helps realize grep through organized Interactors. For example, if sent interactor as
 ARG contains calling of other interactors, it will try to find entries in them. More in specs"
  spec.homepage      = "https://github.com/ZamanovArslan/grep-interactors"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ZamanovArslan/grep-interactors"

  spec.add_runtime_dependency 'dry-auto_inject'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.require_paths = ["lib"]
end
