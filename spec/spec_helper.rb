# frozen_string_literal: true

require 'byebug'
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'gmi2html'

RSpec.configure do |config|
  config.filter_run_when_matching :focus

  config.disable_monkey_patching!

  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed

  config.raise_errors_for_deprecations!
end
