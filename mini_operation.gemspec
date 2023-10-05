# frozen_string_literal: true

require_relative "lib/mini_operation/version"

Gem::Specification.new do |spec|
  spec.name = "mini_operation"
  spec.version = MiniOperation::VERSION
  spec.authors = ["Andre Durao"]
  spec.email = ["andreluisdurao@gmail.com"]

  spec.summary = "A gem to write easy to read classes that perform in order"
  spec.description = "A ruby library to ease up writing classes that always execute methods on same order. Inspired by Trailblazer's operation interface."
  spec.homepage = "https://github.com/andredurao/mini_operation"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/andredurao/mini_operation/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
