require './app/models/location.rb'

class LocationTest
  def initialize(ip_start, ip_end, country_code)
    @ip_start = ip_start
    @ip_end = ip_end
    @country_code = country_code
  end
  #keep plating
  #format example for adress '140 Market St, San Francisco, CA'
  def locationer
    a=Geokit::Geocoders::GoogleGeocoder.geocode @ip_start
    b=Geokit::Geocoders::GoogleGeocoder.geocode @ip_end
    return a.distance_to(b)
  end

  def self.test_console
    puts 'test success'
  end
end
