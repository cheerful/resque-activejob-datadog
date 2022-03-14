# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "resque/activejob/datadog"

require "minitest/autorun"
