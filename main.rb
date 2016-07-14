require_relative("core.rb")


system "cls"

$core = Core.new
# $core.start
$core.listen while(true)