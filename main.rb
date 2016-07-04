include Math
require_relative("Float.rb")
require_relative("Coordinate.rb")
require_relative("Path.rb")
# require_relative("LatLong2Vector.rb")

mtl = Coordinate.new(45.5017, -73.5673)
van = Coordinate.new(49.2827, -123.1207)
ist = Coordinate.new(31.2304, 121.4737)
sha = Coordinate.new(41.0082, 28.9784)
bna = Coordinate.new(48.509, -125.263)
lax = Coordinate.new(47.983, -128.639)

# parcours = Path.new

cities = {
  "mtl" => mtl,
  "van" => van,
  "ist" => ist,
  "sha" => sha,
  "bna" => bna,
  "lax" => lax,
}

path = Path.new([
  Coordinate.new(45.5017, -73.5673),
  Coordinate.new(49.2827, -123.1207)
])

# puts mtl.distanceFrom(van)

puts "%.2f" % cities[ARGV[0]].distanceFrom(cities[ARGV[1]])
puts path.segmentLength(0)

# Test path
# pos1 48.509 -125.263
# pos2 47.983 -128.639
# pos3 47.048 -125.684
# length 474km (260nmi)