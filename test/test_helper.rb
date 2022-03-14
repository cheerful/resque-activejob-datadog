# frozen_string_literal: true

require "bundler"
Bundler.require(:default, :test, :development)

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "resque/activejob/datadog"

require "minitest/autorun"
