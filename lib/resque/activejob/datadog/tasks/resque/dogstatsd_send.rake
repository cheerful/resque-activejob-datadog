# frozen_string_literal: true

namespace :resque do
  desc "Send data to dogstatsd"
  task dogstatsd_send: :environment do
    top_level_info = %i[pending processed queues workers working failed]
    dogstatsd_client = Resque::ActiveJob::Datadog::DogStatsdInstance.instance

    Resque.info.slice(*top_level_info).each do |label, value|
      dogstatsd_client.gauge("resque.info.#{label}", value)
    end

    Resque.queue_sizes.each do |queue, size|
      dogstatsd_client.gauge("resque.#{queue}.pending", size)
    end
  end
end
