class Welcome

  def initialize; end
  
  def name; return "welcome" end

  def run param = nil
    load("Apps/form.rb")
    load("Apps/clock.rb")

    text = ""
    text += "Welcome to the core"
    text += "\n#{Clock.new.run.no_colors.cyan}"
    text += "\n"
    
    puts Form.new(text).multiLine
    
  end
  
end