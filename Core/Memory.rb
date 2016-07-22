class Memory

  def clean

    lines = File.open('Core/history').to_a
    
    return if lines.count <= 10

    lines.shift while lines.count > 10

    File.open('Core/history', "w") do |f|
      
      lines.each do |line|
        f << line
      end

    end

  end

  def get_last

    lines = File.open('Core/history').to_a
    return lines.last.to_s.strip

  end

  def add_to value = nil
    
    return unless value
    File.open('Core/history', 'a') do |f|
      f << "#{value}"
    end

    clean

  end
  
end