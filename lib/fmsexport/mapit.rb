module Fmsexport
  class Mapit
    include HTTParty
    base_uri 'mapit.mysociety.org'

    def initialize
      @headers = { 'X-Api-Key' => ENV['MAPIT_API_KEY'] }
    end

    def area_children(area)
      self.class.get("/area/#{area}/children?min_generation=1", { headers: @headers })
    end

  end
end
