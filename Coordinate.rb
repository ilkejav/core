class Coordinate
  
  def initialize lat, lon

    @lon = lon
    @lat = lat
    
  end

  def lat ; return @lat end
  def lon ; return @lon end

  def deg2rad

    return PI / 180

  end

  def distanceFrom coord

    lat1 = @lat * deg2rad
    lon1 = @lon * deg2rad
    lat2 = coord.lat * deg2rad
    lon2 = coord.lon * deg2rad

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    c = 2 * 6371 * asin(sqrt(sin((lat2-lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((lon2 - lon1)/2)**2))

    return c

  end

end