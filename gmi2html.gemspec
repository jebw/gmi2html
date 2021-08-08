# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmi2html/version'

Gem::Specification.new do |gem|
  gem.name        = 'gmi2html'
  gem.version     = Gmi2html::VERSION
  gem.summary     = 'Simple Gemini to HTML convertor'
  gem.description = <<~DESCRIPTION
    Simple pure ruby Gemini to HTML convertor
  DESCRIPTION
  gem.authors     = ['Jeremy Wilkins']
  gem.email       = ['jeb@jdwilkins.co.uk']
  gem.homepage    = 'https://github.com/jebw/gmi2html'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w[lib]
  gem.required_ruby_version = '>= 2.5.0'

  gem.add_dependency 'gemtext'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'byebug'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.10'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'rubocop-rake'
  gem.add_development_dependency 'rubocop-rspec', '~> 2.2.0'
  gem.add_development_dependency 'simplecov', '>= 0.21.2'
  gem.add_development_dependency 'yard'
end
