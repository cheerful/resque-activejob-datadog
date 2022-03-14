# frozen_string_literal: true

module Resque
  module ActiveJob
    module Datadog
      # The per-thread shared instance of `Datadog::Statsd`
      class DogStatsdInstance
        THREAD_VARIABLE = "__resque_activejob_datadog_dog_statsd_instance"

        def self.instance
          Thread.current[THREAD_VARIABLE] ||= ::Datadog::Statsd.new("localhost", 8125)
        end

        def self.close!
          instance.close
          Thread.current[THREAD_VARIABLE] = nil
        end
      end
    end
  end
end
