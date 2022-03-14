# frozen_string_literal: true
module Resque
  module ActiveJob
    module Datadog
      class DogStatsdInstance
        THREAD_VARIABLE = '__resque_activejob_datadog_dog_statsd_instance'

        def self.instance
          Thread.current[THREAD_VARIABLE] ||= ::Datadog::Statsd.new('localhost', 8125)
        end

        def self.close!
          instance.close
          Thread.current[THREAD_VARIABLE] = nil
        end
      end
    end
  end
end