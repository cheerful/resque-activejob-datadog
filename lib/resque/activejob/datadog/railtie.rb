# frozen_string_literal: true

require "resque/activejob/datadog"
require "rails"

module Resque
  module ActiveJob
    module Datadog
      # Railtie to autoload the rake tasks
      class Railtie < Rails::Railtie
        railtie_name :resque_activejob_datadog

        rake_tasks do
          path = File.expand_path(__dir__)
          Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
        end
      end
    end
  end
end
