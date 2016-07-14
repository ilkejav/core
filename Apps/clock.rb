class Clock

  def name; return "clock" end
  
  def run param = nil
    case param
    when "year"
      year.green
    when "month"
      month.green
    when "day"
      day.green
    when "weekday"
      weekday.green
    when "hour"
      hour.green
    else
      return "#{weekday}, #{month} #{day} #{year}, at #{hour}".green
    end
  end

  def hour
    return Time.now.strftime('%H:%M')
  end

  def day
    return Time.now.strftime('%d')
  end

  def weekday
    return Time.now.strftime('%A')
  end

  def month
    return Time.now.strftime('%B')
  end

  def year
    return Time.now.strftime('%Y')
  end

end