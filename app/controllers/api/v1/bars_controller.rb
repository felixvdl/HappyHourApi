class Api::V1::BarsController < ApplicationController

  require 'geocoder'

  def index
    bars = Bar.all.to_a
    hour = Time.now.strftime("%H")
    user_location = Geokit::LatLng.new(request.headers['latitude'], request.headers['longitude'])
    case Time.now.strftime("%A").downcase
      
    when "monday"
      bars = bars.select { |bar| bar.monday != "no"}
      bars = bars.select { |bar|
        if (bar.monday[0..3] == "12pm" || bar.monday[0..3] == "11am" || bar.monday[0..4] == "12:30")
          ((bar.monday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.monday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.monday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.monday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
    when "tuesday"
      bars = bars.select { |bar| bar.tuesday != "no"}
      bars = bars.select { |bar|
        if (bar.tuesday[0..3] == "12pm" || bar.tuesday[0..3] == "11am" || bar.tuesday[0..4] == "12:30")
          ((bar.tuesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.tuesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.tuesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.tuesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
    when "wednesday"
      bars = bars.select { |bar| bar.wednesday != "no"}
      bars = bars.select { |bar|
        if (bar.wednesday[0..3] == "12pm" || bar.wednesday[0..3] == "11am" || bar.wednesday[0..4] == "12:30")
          ((bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.wednesday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
    when "thursday"
      bars = bars.select { |bar| bar.thursday != "no"}
      bars = bars.select { |bar|
        if (bar.thursday[0..3] == "12pm" || bar.thursday[0..3] == "11am" || bar.thursday[0..4] == "12:30")
          ((bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.thursday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
    when "friday"
      bars = bars.select { |bar| bar.friday != "no"}
      bars = bars.select { |bar|
        if (bar.friday[0..3] == "12pm" || bar.friday[0..3] == "11am" || bar.friday[0..4] == "12:30")
          ((bar.friday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.friday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.friday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.friday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
    when "saturday"
      bars = bars.select { |bar| bar.saturday != "no"}
      bars = bars.select { |bar|
        if (bar.saturday[0..3] == "12pm" || bar.saturday[0..3] == "11am" || bar.saturday[0..4] == "12:30")
          ((bar.saturday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.saturday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.saturday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.saturday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
    when "sunday"
      bars = bars.select { |bar| bar.sunday != "no"}
      bars = bars.select { |bar|
        if (bar.sunday[0..3] == "12pm" || bar.sunday[0..3] == "11am" || bar.sunday[0..4] == "12:30")
          ((bar.sunday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i)..(bar.sunday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        else
          ((bar.sunday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/).first.first.to_i + 12)..(bar.sunday.scan(/(\d{1,2}:?\d{0,2}|\D{1,2})/)[3].first.to_i + 11)).to_a.include?(hour.to_i) == true
        end
      }
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
