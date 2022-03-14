# frozen_string_literal: true

require "active_job"
require "datadog/statsd"
require "resque"
require "active_support/core_ext/benchmark"
require_relative "datadog/version"
require_relative "datadog/dog_statsd_instance"
require_relative "datadog/benchmark_stats"

module Resque
  module ActiveJob
    # Base module
    module Datadog
      class Error < StandardError; end

      require "resque/activejob/datadog/railtie" if defined?(Rails)
    end
  end
end
