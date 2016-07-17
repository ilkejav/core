require_relative("memory.rb")
require 'io/console'

class Core

  def initialize
    # @memory = Memory.new
    @lastCommand = nil
    load("Apps/colorize.rb")
    load("Apps/welcome.rb")
    Welcome.new.run
  end

  def path ; return Dir.getwd end
  def memory ; return @memory end
  # def lastCommand ; return @lastCommand end
  def name; return "core" end

  def listen
    
    print "\n  #{name.upcase} > ".cyan
    
    command = $stdin.readline().strip.downcase
    
    load("Apps/colorize.rb")

    case command
    when "quit", "exit"
      then puts("\n"); exit 0; return false
    when "clear"
      then system "cls"; load("Apps/welcome.rb"); Welcome.new.run; return false
    when ""
      then puts "\n"; return false
    # when "~","last"
    #   then command = @lastCommand if @lastCommand != nil; log(parse(command))
    else
      @lastCommand = command
      log(parse(command))
    end
  
  end

  def parse command

    arguments = command.split(" ")
    commands = arguments.shift
    app = find(commands)

    if(app)
      load(File.join("#{path}","#{app}"))
      answerer = Object.const_get(commands.capitalize).new 
      return answerer.name,answerer.run(arguments)
    else
      return "#{name.upcase}","Cannot find #{commands}".red
    end

  end

  def find app_name

    pattern = File.join("**","#{app_name}.rb")

    Dir.glob(pattern) do |found_app|
      return (found_app)
    end

  end

  def log answer
    
    return nil if !answer 

    answerer = answer.first
    content = answer.last.to_s

    puts "  #{answerer.upcase} > #{content}\n"
    
  end

end