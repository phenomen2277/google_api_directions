# GoogleApiDirections

A ruby wrapper class for the Google Directions API.

## Installation

Add this line to your application's Gemfile:

    gem 'google_api_directions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_api_directions

## Usage

    require "google_api_directions"

Create a new instance of GoogleDirections.
**You can pass the APIKEY to the constructor if you own one (optional).**

    g = GoogleApiDirections::GoogleDirections.new

Let's get the directions. The first paramameter is the origin, the second one is the destination
and the third one is the language to be used for the directions and it's optional ("en" is default).
**Watch out couse Exceptions can be thrown here.**

    result = g.directions("Fittjavägen 1 Norsborg", "Slottsbacken 1 Stockholm", "sv")

Lets get the directions. An array of string will be returned.

    directions_array = result[:directions]

Print out the directions in steps.

    directions_array.each do |step|
        #Print out Ex. {Continue forward to the end of the road, 1 km, 2 minutes
        puts step.route + ", " + step.distance + ", " step.duration
    end

How about the distance information (in total)!? A string will be returned.

    #Ex. 7 km
    distance = result[:distance]

And the duration of time (in total)? A string will be returned.

    #Ex. 17 minutes
    duration = result[:duration]