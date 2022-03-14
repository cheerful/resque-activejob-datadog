# frozen_string_literal: true

module Resque
  module ActiveJob
    module Datadog
      module BenchmarkStats
        extend ActiveSupport::Concern

        included do
          around_perform :benchmark_stats
        end

        def dogstatsd_client
          DogStatsdInstance.instance
        end

        def benchmark_stats(&block)
          benchmark = Benchmark.ms(&block)
          dogstatsd_client.timing("activejob.#{queue_name}.processed", benchmark)
          dogstatsd_client.timing("activejob.#{self.class}.processed", benchmark)
        end
      end
    end
  end
end
