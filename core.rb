class Core

  def initialize
    load "Core/memory.rb"
    load "Core/colorize.rb"
    load "Core/welcome.rb"
    load "Core/find.rb"
    load "Core/spellcheck.rb"
    load "Core/colorize.rb"
    require "csv"
    
    @memory = Memory.new
    @finder = Find.new
    @spellchecker = Spellcheck.new
    
    puts Welcome.new.run
    memory.record Welcome.new.run
  end

  def path ; return Dir.getwd end
  def memory ; return @memory end
  def finder; return @finder end
  def spellchecker; return @spellchecker end

  def listen
    
    print "\n  CORE > ".cyan
    memory.record "\n  CORE > ".cyan
    
    command = $stdin.readline().strip.downcase
    
    case command
    when "show"
      memory.record "show"
      system "cls"
      puts memory.recall
      # File.read('Core/history_screen', 'r') do |f|
      #   puts f  
      # end
    # when "reboot"
    #   then system("#{path}/Core/reboot.bat")
    #   puts File.open("#{path}/Core/reboot.bat")
    #   puts "trying to reboot"
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
      
      memory.record "\n"
      return false
    when "~","last"
      then command = memory.get_last
      puts "  LAST > #{command}"
      log(parse(command))
    else
      log(parse(command))
    end
  
  end

  def parse command

    # arguments = command.split(" ")
    arguments = CSV.parse(command, col_sep: ' ').flatten
    commands = arguments.shift
    app = finder.find_app(commands)

    if(app)
      load(File.join("#{path}","#{app}"))
      answerer = Object.const_get(commands.capitalize).new
      name = answerer.respond_to?("name") ? answerer.name : "#{app}"
      memory.add_to("\n#{command}")
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
    memory.record "  #{answerer.upcase} > #{content}\n"
    
  end

  def store text

    memory.record text
    # str = "#{text}"
    # File.open('Core/history_screen', 'a') do |f|
    #   f << str
    # end

  end

end