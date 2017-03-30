class Api::V1::BarsController < ApplicationController


  def index
    bars = Bar.all.to_a
    hour = Time.now.strftime("%H")

    user_location = Geokit::LatLng.new(bar_params[:latitude], bar_params[:longitude])

    case Time.now.strftime("%A").downcase
    when "wednesday"
      bars = bars.select { |bar| bar.wednesday != "no"}
      bars = bars.select { |bar| ((bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == true }
    when "thursday"
      bars = bars.select { |bar| bar.thursday != "no"}
      bars = bars.select { |bar| ((bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 12)).to_a.include?(hour.to_i) == false }
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
