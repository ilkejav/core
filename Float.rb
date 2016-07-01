class Float

	def km2Nm distance
	  return distance * 0.539957
	end

	def nm2Km distance
	  return distance * 1.852
	end

	def Rad2Deg angle
	  return angle * (180/Math::PI)
	end

end