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
    if index > coordinates.length then return 0 end
    return coordinates[index.to_i].distanceFrom(coordinates[index.to_i+1])

  end

  def getDistance start = 0, finish = coordinates.length

    sum = 0
    i = 0
    while i < coordinates.length 
      if i >= start && i < finish 
        sum += segmentLength(i)
      end
      i+=1
    end
    return sum

  end

end