# frozen_string_literal: true

require_relative "datadog/version"

module Resque
  module ActiveJob
    module Datadog
      class Error < StandardError; end
      # Your code goes here...
    end
  end
end
