include Math

def Km2Nm distance
  return distance * 0.539957
end

def Nm2Km distance
  return distance * 1.852
end

def Rad2Deg angle
  return angle * (180/Math::PI)
end

class Coordinate
  
  def initialize lat, lon
    @lon = lon
    @lat = lat
  end

  def lat
    return @lat
  end

  def lon
    return @lon
  end

  def deg2rad
    return PI / 180
  end

  def power(num, pow)
    return num ** pow
  end

  def distanceFrom coord

    lat1 = @lat * deg2rad
    lon1 = @lon * deg2rad
    lat2 = coord.lat * deg2rad
    lon2 = coord.lon * deg2rad

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    # a = power(sin(dlat/2), 2) + cos(lat1) * cos(lat2) * power(sin(dlon/2), 2)

    # a = ((sin(dlat/2))**2) + cos(lat1) * cos(lat2) * ((sin(dlon/2))**2)
    # c = 6371 * 2 * atan2(sqrt(a), sqrt(1-a))

    c = 2 * 6371 * asin(sqrt(sin((lat2-lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((lon2 - lon1)/2)**2))

    return c

  end

end

# def spherical_distance start_coords, end_coords
#   lat1 = (Math::PI / 180) * start_coords.lat
#   long1 = ((Math::PI / 180) * start_coords.lon
#   lat2 = ((Math::PI / 180) * end_coords.lat
#   long2 = ((Math::PI / 180) * end_coords.lon
#   return 2 * 6371 * asin(sqrt(sin((lat2-lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((long2 - long1)/2)**2))
# end

mtl = Coordinate.new(45.5017, -73.5673)
van = Coordinate.new(49.2827, -123.1207)
ist = Coordinate.new(31.2304, 121.4737)
sha = Coordinate.new(41.0082, 28.9784)
bna = Coordinate.new(36.12, -86.67)
lax = Coordinate.new(33.94, -118.4)

puts mtl.distanceFrom(van)
# puts spherical_distance(mtl,van)