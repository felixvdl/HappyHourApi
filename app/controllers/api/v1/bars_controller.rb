class Api::V1::BarsController < ApplicationController

  require 'geocoder'

  def index
    bars = Bar.all.to_a
    hour = Time.now.strftime("%H")
    user_location = Geokit::LatLng.new(request.headers['latitude'], request.headers['longitude'])
    p hour
    case Time.now.strftime("%A").downcase
    when "monday"
      bars = bars.select { |bar| bar.monday != "no"}
      bars = bars.select { |bar| ((bar.monday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.monday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
    when "tuesday"
      bars = bars.select { |bar| bar.tuesday != "no"}
      bars = bars.select { |bar| ((bar.tuesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.tuesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
    when "wednesday"
      bars = bars.select { |bar| bar.wednesday != "no"}
      bars = bars.select { |bar| ((bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
    when "thursday"
      bars = bars.select { |bar| bar.thursday != "no"}
      bars = bars.select { |bar| ((bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
      bars = bars.select { |bar| bar.geolocation != ','}
    when "friday"
      bars = bars.select { |bar| bar.friday != "no"}
      bars = bars.select { |bar| ((bar.friday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.friday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
      bars = bars.select { |bar| bar.geolocation != ','}
    when "saturday"
      bars = bars.select { |bar| bar.saturday != "no"}
      bars = bars.select { |bar| ((bar.saturday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.saturday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
      bars = bars.select { |bar| bar.geolocation != ','}
    end

      bars.each do |bar|
        bar.update(distance: user_location.distance_to(bar.geolocation))
      end
      bars.sort_by! { |bar| bar.distance}

    render json: bars
  end

  protected
    def bar_params
      params.permit(:latitude, :longitude)
    end


end
