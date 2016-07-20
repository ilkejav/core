class Welcome

  def initialize; end
  
  def name; return "welcome" end

  def run param = nil
    load("Core/form.rb")
    load("Core/clock.rb")

    text = ""
    text += "Welcome to the core"
    text += "\n#{Clock.new.run.cyan}"
    text += "\n"
    
    puts Form.new(text).multiLine
    
  end
  
end