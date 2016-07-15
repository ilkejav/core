class Form

	def initialize text = nil
    @text = text
  end

  def name; return "form" end

  def multiLine 
    
    newText = "\n"

    if @text.lines.length > 1
      @text.lines.each do |i|
        newText += "  |  ".no_colors
        newText += "#{i}"
      end
    end
    return newText.rstrip
  end

  def list
    
  end

end