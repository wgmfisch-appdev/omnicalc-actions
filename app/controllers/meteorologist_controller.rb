require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    sanitized_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A sanitized version of the street address, with spaces and other illegal
    #   characters removed, is in the string sanitized_street_address.
    # ==========================================================================
    url_google = "https://maps.googleapis.com/maps/api/geocode/json?address=" + sanitized_street_address.to_s + "&key=AIzaSyBr-0XDfztIIUGyPRfa1D5KfPvURvAk2e4"
    parsed_location = JSON.parse(open(url_google).read)
    @latitude = parsed_location.dig("results", 0, "geometry", "location", "lat")
    @longitude = parsed_location.dig("results", 0, "geometry", "location", "lng")

    url_weather = "https://api.darksky.net/forecast/75f97e24a44ab175e574fbf3afaa21b7/" + @latitude.to_s + "," + @longitude.to_s
    parsed_data = JSON.parse(open(url_weather).read)

    @current_temperature = parsed_data.dig("currently", "temperature")

    @current_summary = parsed_data.dig("minutely", "summary")

    @summary_of_next_sixty_minutes = parsed_data.dig("hourly", "summary")

    @summary_of_next_several_hours = parsed_data.dig("hourly", "data", 0, "summary")

    @summary_of_next_several_days = parsed_data.dig("daily", "summary")

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end
