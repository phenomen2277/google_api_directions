require 'net/http'
require 'open-uri'
require 'json'
require_relative 'google_directions_route'

module GoogleApiDirections

  class GoogleDirections
    def initialize(apikey = "")
      @apikey = apikey
      @directions = []
    end

    def directions(origin, destination, language = "en")
      raise ArgumentError, "Argument(s) are missing or are empty" if origin.strip.empty? || destination.strip.empty?

      @directions.clear unless @directions.empty?
      set_uri(origin, destination, language)

      begin
        resp = Net::HTTP.get_response(URI.parse(@uri))
        data = resp.body
        distance = JSON.parse(data)["routes"][0]["legs"][0]["distance"]["text"]
        duration = JSON.parse(data)["routes"][0]["legs"][0]["duration"]["text"]
        result = JSON.parse(data)["routes"][0]["legs"][0]["steps"]
      rescue Exception => e
        raise e.message
      end

      result.each do |direction|
        text = remove_html_tags(direction["html_instructions"])
        route_distance = direction["distance"]["text"]
        route_duration = direction["duration"]["text"]

        @directions << GoogleApiDirections::GoogleDirectionsRoute.new(text.gsub("  ", " "), route_distance, route_duration)
      end

      {:directions => @directions, :distance => distance, :duration => duration}
    end

    private
    def remove_html_tags(text)
      text.gsub(%r{</?[^>]+?>}, " ")
    end

    def set_uri(origin, destination, language)
      @apikey = "&key=" + @apikey unless @apikey.empty?
      @uri = "http://maps.googleapis.com/maps/api/directions/json?origin="
      @uri = @uri + URI::encode(origin) + "&destination=" + URI::encode(destination) + "&language=" + language + "&sensor=false" + @apikey
    end
  end

end
