require_relative("Haversine.rb")
require_relative("LatLong2Vector.rb")
require_relative("GlobalPosition.rb")

mtl = [45.5017, -73.5673]
van = [49.2827, -123.1207]
ist = [31.2304, 121.4737]
sha = [41.0082, 28.9784]
bna = [36.12, -86.67]
lax = [33.94, -118.4]

# actual distances
# Montreal to Vancouver : 3697km -- 1996nmi
# Shanghai to Istambul : 7996km -- 4318nmi
# Montreal to Istambul : 7722km -- 4169nmi
# Shanghai to Vancouver : 9045km -- 4884nmi

puts "%.1f" % spherical_distance(mtl,van)
# puts LatLon2Vec(36.12, -86.67)
# puts Coordinate.new(mtl(0), mtl(1)).distanceFrom(Coordinate.new(van(0), van(1)))