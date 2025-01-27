require_relative 'service'

module AdyenOfficial
  class Recurring < Service
    attr_accessor :version
    DEFAULT_VERSION = 30

    def initialize(client, version = DEFAULT_VERSION)
      service = 'Recurring'
      method_names = [
        :list_recurring_details,
        :disable,
        :store_token
      ]

      super(client, version, service, method_names)
    end
  end
end
