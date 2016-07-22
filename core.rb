# require_relative("memory.rb")

class Core

  def initialize
    load("Core/memory.rb")
    @memory = Memory.new
    load("Core/colorize.rb")
    load("Core/welcome.rb")
    load("Core/find.rb")
    @finder = Find.new
    load("Core/spellcheck.rb")
    @spellchecker = Spellcheck.new
    Welcome.new.run
  end

  def path ; return Dir.getwd end
  def memory ; return @memory end
  # def core; return "core" end
  def finder; return @finder end
  def spellchecker; return @spellchecker end

  def listen
    
    print "\n  CORE > ".cyan
    
    command = $stdin.readline().strip.downcase
    
    load("Core/colorize.rb")

    case command
    when "quit", "exit"
      then system "cls"
      exit 0
      return false
    when "clear"
      then system "cls"
      load("Core/welcome.rb")
      Welcome.new.run
      return false
    when ""
      then puts "\n"
      return false
    when "~","last"
      then command = memory.get_last 
      log(parse(command))
    else
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
      name = answerer.respond_to?("name") ? answerer.name : "#{app}"
      memory.add_to("\n#{command}")
      puts("#{command}")
      return name,answerer.run(arguments)
    else
      return "CORE","Cannot find #{commands.upcase}. Did you mean #{spellchecker.correct(commands).upcase.no_color}#{"?".red}".red
    end

  end

  def log answer
    
    return nil if !answer 

    answerer = answer.first
    content = answer.last.to_s

    puts "  #{answerer.upcase} > #{content}\n"
    
  end

end