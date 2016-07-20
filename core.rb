# require_relative("memory.rb")

class Core

  def initialize
    # @memory = Memory.new
    @lastCommand = nil
    load("Core/colorize.rb")
    load("Core/welcome.rb")
    load("Core/find.rb")
    @finder = Find.new
    Welcome.new.run
  end

  def path ; return Dir.getwd end
  # def memory ; return @memory end
  def name; return "core" end
  def finder; return @finder end

  def listen
    
    print "\n  #{name.upcase} > ".cyan
    
    command = $stdin.readline().strip.downcase
    
    load("Core/colorize.rb")

    case command
    when "quit", "exit"
      then system "cls"; exit 0; return false
    when "clear"
      then system "cls"; load("Core/welcome.rb"); Welcome.new.run; return false
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
    app = finder.find_app(commands)

    if(app)
      load(File.join("#{path}","#{app}"))
      answerer = Object.const_get(commands.capitalize).new 
      return answerer.name,answerer.run(arguments)
    else
      return "#{name.upcase}","Cannot find #{commands}".red
    end

  end

  def log answer
    
    return nil if !answer 

    answerer = answer.first
    content = answer.last.to_s

    puts "  #{answerer.upcase} > #{content}\n"
    
  end

end