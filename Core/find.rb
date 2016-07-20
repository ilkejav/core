class Find

  def name; return "find" end

  def find_app app_name = nil

    pattern = File.join("**","#{app_name}.rb")

    Dir.glob(pattern) do |found_app|
      return (found_app)
    end

  end

end