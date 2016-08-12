class Welcome

  def initialize; end
  
  def name; return "welcome" end

  def run param = nil
    load("Core/form.rb")
    load("Core/clock.rb")

    text = ""
    text += "\nWelcome to the core"
    text += "\n#{Clock.new.run.cyan}\n"
    
    return Form.new(text).multiLine
    
  end
  
end