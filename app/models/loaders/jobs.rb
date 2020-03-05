module Loaders
  class Jobs
    attr_reader :connector

    def initialize(connector = Connectors::Jobs.new(location: 'ny'))
      @connector = connector
    end

    def load!
      connector.all.each do |job|
        Job.where(
          description: job['description'],
          location: job['location']
        ).first_or_create!
      end
    end
  end
end
