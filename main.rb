require_relative("Float.rb")
require_relative("Coordinate.rb")
require_relative("LatLong2Vector.rb")

mtl = Coordinate.new(45.5017, -73.5673)
van = Coordinate.new(49.2827, -123.1207)
ist = Coordinate.new(31.2304, 121.4737)
sha = Coordinate.new(41.0082, 28.9784)
bna = Coordinate.new(36.12, -86.67)
lax = Coordinate.new(33.94, -118.4)

puts mtl.distanceFrom(van)