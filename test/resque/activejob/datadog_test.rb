# frozen_string_literal: true

require "test_helper"

module Resque
  module ActiveJob
    class DatadogTest < Minitest::Test
      def test_that_it_has_a_version_number
        refute_nil ::Resque::ActiveJob::Datadog::VERSION
      end

      class TestJob < ::ActiveJob::Base
        include Resque::ActiveJob::Datadog::BenchmarkStats

        def perform(number:)
          number + 1
        end
      end

      def test_perform_job
        TestJob.perform_now(number: 1)
      end
    end
  end
end
