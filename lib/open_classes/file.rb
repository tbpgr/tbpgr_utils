# encoding: utf-8

# File
class File
  # insert BOM to UTF-8 File
  #
  # this method's main purpose is 'UTF-8 Excel CSV File'.
  #
  # File.insert_bom("input.csv", "output.csv") # => output bommed text to output.csv
  # File.insert_bom("input.csv") # => output bommed text to input.csv
  def self.insert_bom(input_filename, output_filename = nil)
    src = File.read(input_filename)
    output_filename ||= input_filename
    File.open(output_filename, 'w:UTF-8') do |f|
      src = '   ' + src
      src.setbyte(0, 0xEF)
      src.setbyte(1, 0xBB)
      src.setbyte(2, 0xBF)
      f.print src
    end
  end
end
