require_relative("memory.rb")

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
    
    command = $stdin.readline().strip
    
    load("Apps/colorize.rb")

    case command.downcase
    when "quit", "exit"
      puts("\n")
      exit 0 
      return false
    when "clear"
      system "cls"
      load("Apps/welcome.rb")
      Welcome.new.run
      return false
    when ""
      puts "\n"
      return false
    when "~","last"
      command = @lastCommand if @lastCommand != nil
      log(parse(command))
    else
      @lastCommand = command
      log(parse(command))
    end
  
  end

  def parse command

    cmd = command.split(" ").first.to_s.downcase
    param = command.sub(cmd,"").strip

    if Dir["Apps/*"].include?("Apps/#{cmd}.rb")
      load("#{path}/Apps/#{cmd}.rb")
      answerer = Object.const_get(cmd.capitalize).new 
      return answerer.name,answerer.run(param)
    else
      return "#{name.upcase}","Cannot find #{cmd}".red
    end

  end

  def log answer
    
    answerer = answer.first
    content = answer.last.to_s

    puts "  #{answerer.upcase} > #{content}\n"
    
  end

end