class Welcome

  def initialize; end
  
  def name; return "welcome" end

  def run param = nil
    load("Apps/form.rb")
    load("Apps/clock.rb")

    text = ""
    text += "Welcome to the core"
    text += "\n#{Clock.new.run.cyan}"
    text += "\nTODO:"
    text += "\n - investigate rescue command".red
    text += "\n - prevent cmd from closing on error"
    text += "\n - catch keyboard inputs like esc and arrows"
    text += "\n - send stuff to clipboard".red
    text += "\n - investigate drawing with SVG".red
    text += "\n - change colorize structure to prevent leaking"
    text += "\n - investigate writing to files".red
    text += "\n - refactor core and apps structure"
    text += "\n - create standard app template"
    text += "\n - make app find recursive".red
    text += "\n"
    
    puts Form.new(text).multiLine
    
  end
  
end