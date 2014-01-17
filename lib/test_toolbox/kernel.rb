require 'stringio'

#  Kernel
module Kernel
  # capture STDOUT
  #
  #
  # capture print
  #   print capture_stdout { print "hoge" } # => hoge
  #
  # if block have no STDOUT, capture_stdout returns empty.
  #   print capture_stdout {  }.empty? # => true
  def capture_stdout
    begin
      $stdout = StringIO.new
      yield
      result = $stdout.string
    ensure
      $stdout = STDOUT
    end
    result
  end

  # debug print line for print-debugging
  #
  #
  # debug print default
  #   dp_line __LINE__
  #   # yy = call line no
  #   # => --------------------|filename=|line=yy|--------------------
  #
  # debug print with filename
  #   dp_line __LINE__, filename: __FILE__
  #   # xx = filename, yy = call line no
  #   # => --------------------|filename=xx|line=yy|--------------------
  #
  # debug print with no filename, specific char
  #   dp_line __LINE__, char: '@'
  #   # xx = filename, yy = call line no
  #   # => @@@@@@@@@@@@@@@@@@@@|filename=|line=yy|@@@@@@@@@@@@@@@@@@@@
  def dp_line(line, options = { filename: '', char: '-' })
    filename = options[:filename].nil? ? '' : options[:filename]
    char = options[:char].nil? ? '-' : options[:char]
    puts "#{char * 20}|filename=#{filename}|line=#{line}|#{char * 20}"
  end
end
