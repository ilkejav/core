include Math
include Matrix

# def llarToWorld(latit, longit, altid, rad):
#     x = math.sin(longit) * math.cos(latit)
#     z = math.sin(longit) * math.sin(latit)
#     y = math.cos(longit)
#     v = c4d.Vector(x, y, z)
#     v = v * altid + v * rad
#     return v

def LatLon2Vec lat, lon
  # f = 0
  # ls = atan((1-f)**2 * tan(lat))
  x = cos(lat) * cos(lon)
  y = sin(lat) * sin(lon)
  z = sin(lat)
  return Vector.new[x,y,z]
end

def Vec2LatLon vec
  vec = Vector.new[vec]
  lat = asin(vec.z)
  lon = atan(vec.y,vec.x)
  return [lat,lon]
end