# frozen_string_literal: true

require_relative "lib/applin/rails/version"

Gem::Specification.new do |spec|
  # https://guides.rubygems.org/publishing/
  # https://guides.rubygems.org/specification-reference/
  spec.name = "applin-rails"
  spec.version = Applin::Rails::VERSION
  spec.authors = ["Michael Leonhard"]
  spec.email = ["michael@leonhardllc.com"]
  spec.summary = "Applin™ server library for Ruby on Rails"
  spec.description = "Create mobile apps using only backend code.  Applin™ is a Server-Driven UI (SDUI) system."
  spec.homepage = "https://www.applin.dev/"
  spec.license = "LicenseRef-LICENSE.md"
  spec.required_ruby_version = ">= 3.2"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/leonhard-llc/applin-rails"
  spec.metadata["changelog_uri"] = "https://raw.githubusercontent.com/leonhard-llc/applin-rails/main/CHANGELOG.md"

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
