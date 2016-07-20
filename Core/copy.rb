class Copy
  
  def name; return "copy" end

  def run param = nil

    puts param if param
    success = system ("clip < clip")

    return success ? "bwarg copied to clipboard" : "failed to copy"

  rescue
    return "error"
  end
end