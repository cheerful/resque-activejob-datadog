# frozen_string_literal: true
require "resque/activejob/datadog"
require 'rails'

module Resque::ActiveJob::Datadog
  class Railtie < Rails::Railtie
    railtie_name :resque_activejob_datadog

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end