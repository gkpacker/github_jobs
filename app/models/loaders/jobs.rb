module Loaders
  class Jobs
    attr_reader :connector

    def initialize(params = { location: 'ny' }, connector = Connectors::Jobs)
      @connector = connector.new(location: params[:location])
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
