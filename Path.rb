require_relative("Coordinate.rb")

class Path

  def initialize coordinates

    @coordinates = coordinates
    # @distances = nil

  end

  def distances ; return @distances end
  def coordinates ; return @coordinates end

  # def nearest
    
  # end

  def segmentLength index

    return coordinates[index.to_i].distanceFrom(coordinates[index.to_i+1])

  end

  # def length start, finish

  #   for i = start in coordinates
  #     if i < coordinates.length || i < finish
  #       @distances.push( path[i].distanceFrom[i+1] )
  #   coordinates

  #   return @distances

  # end

end