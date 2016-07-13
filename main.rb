require_relative("Playground.rb")
require("date")
require_relative("Apps/colorize.rb")

$playground = Playground.new

system "cls"

puts("\n  | Hello, today is") 
puts("  | " + "#{Date.today.strftime('%a, %b %d %Y')}".cyan)
puts("\n".no_colors)

$playground.listen while(true)