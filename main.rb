require_relative("core.rb")


system "cls"

$core = Core.new

$core.listen while(true)