class Help

  def name; return "help" end

	def run param = nil
    list = ""
    Dir["Apps/*"].each do |filename|
      if !filename.include?(".")
        list+= filename.split("/").last.gray + "/" + "\n"
      else
        list+= filename.split("/").last.sub(".rb","").upcase.green + "\n"
      end
    end
    return list
  end

end