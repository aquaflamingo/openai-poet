# frozen_string_literal: true

require_relative "lib/openaipoet/version"

Gem::Specification.new do |spec|
  spec.name = "openaipoet"
  spec.version = OpenAIPoet::VERSION
  spec.authors = ["@aquaflamingo"]
  spec.email = ["16901597+aquaflamingo@users.noreply.github.com"]

  spec.summary = "Generate poems with Open AI."
  spec.description = "Try to use Open AI's GPT-3 text generation engine to generate a poem."
  # FIXME: URL
  spec.homepage = "https://github.com/aquaflamingo"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  # FIXME: URL
  spec.metadata["source_code_uri"] = "https://github.com/aquaflamingo"
  # FIXME: URL
  spec.metadata["changelog_uri"] = "https://github.com/aquaflamingo"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
