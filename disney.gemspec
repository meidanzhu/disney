require_relative 'lib/disney/version'

Gem::Specification.new do |spec|
  spec.name          = "disney"
  spec.version       = Disney::VERSION
  spec.authors       = ["meidanzhu"]
  spec.email         = ["meidan.zhu@gmail.com"]

  spec.summary       = "Learning to make my first CLI project"
  spec.description   = "It is about Walt Disney World"
  spec.homepage      = "https://github.com/meidanzhu/disney"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/meidanzhu/disney"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/meidanzhu/disney"
  spec.metadata["changelog_uri"] = "https://github.com/meidanzhu/disney"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

end
