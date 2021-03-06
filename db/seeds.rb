infatuation = File.read('./public/infatuation_results.json')
infatuation_data = JSON.parse(infatuation)

infatuation_data.each do |bar|
  name = bar['bar']
  location = "#{bar['location']}, New York"
  monday = bar['monday']
  tuesday = bar['tuesday']
  wednesday = bar['wednesday']
  thursday = bar['thursday']
  friday = bar['friday']
  saturday = bar['saturday']
  sunday = bar['sunday']
  deal = bar['deal']
  info = bar['info']
  geolocation = Geokit::Geocoders::GoogleGeocoder.geocode location
  bar = Bar.create!(name: name, location: location, monday: monday, tuesday: tuesday, wednesday: wednesday, thursday: thursday, friday: friday, saturday: saturday, sunday: sunday, deal: deal, info: info, geolocation: geolocation.ll)
end
