class Memory

  def initialize

    @storage = []
  
  end

  def save index, value
    
    @storage.push(value)

  end

  def last index

    return @storage.last
    
  end
  
end