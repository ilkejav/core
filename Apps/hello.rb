class Hello

  def name; return "hello" end

	def run param = nil
    if param.to_s != ""
      $playground.memory.save(param)
      return "Your name is #{$playground.memory.load('name')}"
    else
      return "Hello #{$playground.memory.load('name')}"
    end
  end

end