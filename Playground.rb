require_relative("memory.rb")
require_relative("Apps/colorize.rb")

class Playground

  def initialize
    @memory = Memory.new
  end

  def path ; return "/GitHub/Playground" end
  def memory ; return @memory end

  def listen
    
    print "  CORE > ".cyan
    
    command = $stdin.readline().strip

    if command.downcase == "quit" 
      puts("\n")
      exit 0 
      return false 
    end

    if command.empty?
      puts "\n"
      return false
    end
    
    log(parse(command))
  
  end

  def log answer
    
    answerer = answer.first
    content = answer.last.to_s

    if content.lines.length > 1
        puts "  #{answerer.upcase} >"
      content.lines.each do |line|
        puts "    #{line}"
      end
    else
      puts "  #{answerer.upcase} > #{content}\n"
    end
    puts "\n"
    
  end

  def parse command

    cmd = command.split(" ").first.to_s.downcase
    param = command.sub(cmd,"").strip

    if Dir["Apps/*"].include?("Apps/#{cmd}.rb")
      load("#{path}/Apps/#{cmd}.rb")
      answerer = Object.const_get(cmd.capitalize).new 
      return answerer.name,answerer.run(param)
    else
      return "CORE","Cannot find #{cmd}"
    end

  end

end