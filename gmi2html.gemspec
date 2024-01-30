# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmi2html/version'

Gem::Specification.new do |gem|
  gem.name        = 'gmi2html'
  gem.version     = Gmi2html::VERSION
  gem.summary     = 'Gemini to HTML convertor'
  gem.description = <<~DESCRIPTION
    Simple pure ruby Gemini to HTML convertor
  DESCRIPTION
  gem.authors     = ['Jeremy Wilkins']
  gem.email       = ['jeb@jdwilkins.co.uk']
  gem.homepage    = 'https://github.com/jebw/gmi2html'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR).reject do |f|
                        f.match(%r{^(\.|spec)})
                      end
  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w[lib]
  gem.required_ruby_version = '>= 2.5.0'

  gem.metadata = {
    'homepage_uri' => 'https://github.com/jebw/gmi2html/',
    'changelog_uri' => 'https://github.com/jebw/gmi2html/blob/main/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/jebw/gmi2html/',
    'documentation_uri' => "https://github.com/jebw/gmi2html/blob/main/README.md",
    'bug_tracker_uri' => 'https://github.com/jebw/gmi2html/issues',
    'rubygems_mfa_required' => 'true'
  }

  gem.add_dependency 'gemtext', '~> 1.0'

  gem.add_development_dependency 'bundler', '~> 2.2'
  gem.add_development_dependency 'byebug', '~> 11.1'
  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_development_dependency 'rspec', '~> 3.10'
  gem.add_development_dependency 'rubocop', '~> 1.23'
  gem.add_development_dependency 'rubocop-rake', '~> 0.6'
  gem.add_development_dependency 'rubocop-rspec', '~> 2.6'
  gem.add_development_dependency 'simplecov', '~> 0.21'
  gem.add_development_dependency 'yard', '~> 0.9.26'
end
