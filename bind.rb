class Bind

  def name; return "bind" end
  def path ; return "/GitHub/Playground" end

  def run param

    if Dir["*"].include?("#{cmd}.rb")
      load("#{path}/Apps/#{cmd}.rb")
      answerer = Object.const_get(cmd.capitalize).new 
      return answerer.name,answerer.run(param)
    else
      return "CORE","Cannot find #{cmd}"

  end

end