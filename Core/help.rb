class Help

  def name; return "help" end

	def run param = nil
    
    load("Core/form.rb")
    list = ""

    Dir.entries("Apps").each do |filename|

      if filename.end_with?(".","..")
        list+= ""
      elsif filename.end_with?(".rb")
        list+= filename.sub(".rb","").upcase.green + "\n"
      else
        list+= filename.split("/").last.gray + "/" + "\n"
      end

    end

    return Form.new(list).multiLine
  
  end

end