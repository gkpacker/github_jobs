module Connectors
  class Jobs
    BASE_URL = 'https://jobs.github.com/positions.json'
    MAX_PAGES = 5

    attr_reader :full_time, :location

    def initialize(params)
      @full_time = params[:full_time]
      @location = params[:location]
    end

    def all
      jobs = 1.upto(MAX_PAGES).flat_map do |page|
        call_api(page, location: location, full_time: full_time)
      end

      jobs.uniq
    end

    private

    def call_api(page, params)
      response = RestClient.get("#{BASE_URL}?page=#{page}", params: params)

      JSON.parse(response.body)
    end
  end
end
