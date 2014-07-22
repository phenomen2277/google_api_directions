module GoogleApiDirections
  class GoogleDirectionsRoute
    attr_accessor :route, :distance, :duration

    def initialize(route, distance, duration)
      @route = route
      @distance = distance
      @duration = duration
    end

    def to_s
      @route
    end


  end
end