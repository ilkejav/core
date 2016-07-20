class Calc

  def initialize
    
  end

  def name; return "calc" end

  def run param
    
    if param.include?"+"
      parts = param.split("+")
      return parts.first.to_i + parts.last.to_i
    end
    if param.include?"-"
      parts = param.split("-")
      return parts.first.to_i - parts.last.to_i
    end
    return "error".red

  end

end