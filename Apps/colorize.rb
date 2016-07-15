class String

  def colorize color

    color_codes = {
      "black" => '30',
      "red" => '31',
      "green" => '32',
      "brown" => '33',
      "blue" => '34',
      "magenta" => '35',
      "cyan" => '36',
      "gray" => '37',
      "bold" => '1',
      "underline" => '4',
      "no_color" => '0'
      }

    a = "\033["
    b = "#{color_codes[color]}m"
    c = "\e[0m"
    str = "#{a}#{b}#{self}#{c}"

    return str

  end

  def black;            colorize("black") end
  def red;              colorize("red") end
  def green;            colorize("green") end
  def brown;            colorize("brown") end
  def blue;             colorize("blue") end
  def magenta;          colorize("magenta") end
  def cyan;             colorize("cyan") end
  def gray;             colorize("gray") end
  def bold;             colorize("bold") end
  def underline;        colorize("underline") end
  def no_color;         colorize("no_color") end

  # def bg_black;         "\e[40m#{self}\e[0m" end
  # def bg_red;           "\e[41m#{self}\e[0m" end
  # def bg_green;         "\e[42m#{self}\e[0m" end
  # def bg_brown;         "\e[43m#{self}\e[0m" end
  # def bg_blue;          "\e[44m#{self}\e[0m" end
  # def bg_magenta;       "\e[46m#{self}\e[0m" end
  # def bg_cyan;          "\e[47m#{self}\e[0m" end
  # def bg_gray;          "\e[48m#{self}\e[0m" end

  # def bold;             "\e[1m#{self}\e[0m" end
  # def italic;           "\e[3m#{self}\e[0m" end
  # def underline;        "\e[4m#{self}\e[0m" end
  # def blink;            "\e[5m#{self}\e[0m" end
  # def reverse_color;    "\e[7m#{self}\e[0m" end

  def no_colors;   self.gsub(/\e\[\d+m/, "") end

  # def test
  #   str = ""
  #   str += "#{'black'.black}\n"
  #   str += "#{'red'.red}\n"
  #   str += "#{'green'.green}\n"
  #   str += "#{'brown'.brown}\n"
  #   str += "#{'blue'.blue}\n"
  #   str += "#{'magenta'.magenta}\n"
  #   str += "#{'cyan'.cyan}\n"
  #   str += "#{'gray'.gray}\n"
  #   return str
  # end

end

# 0 = Black       8 = Gray
# 1 = Blue        9 = Light Blue
# 2 = Green       A = Light Green
# 3 = Aqua        B = Light Aqua
# 4 = Red         C = Light Red
# 5 = Purple      D = Light Purple
# 6 = Yellow      E = Light Yellow
# 7 = White       F = Bright White