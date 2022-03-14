# frozen_string_literal: true

require "test_helper"

class Resque::ActiveJob::DatadogTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Resque::ActiveJob::Datadog::VERSION
  end

  class TestJob < ActiveJob::Base
    include Resque::ActiveJob::Datadog::BenchmarkStats

    def perform(n:)
      return n + 1
    end
  end

  def test_perform_job
    TestJob.perform_now(n: 1)
  end
end
