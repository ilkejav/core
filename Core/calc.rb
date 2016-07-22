class Calc

  def initialize
    
  end

  def name; return "calc" end

  def run param = nil
    
    if param.include?"+"
      parts = param.split("+")
      return parts.first.to_i + parts.last.to_i
    end
    if param.include?"-"
      parts = param.split("-")
      return parts.first.to_i - parts.last.to_i
    end
    if param.first == "" or param.size == 0
      return "please include parameters".red
    end
    return "error".red

  end

end