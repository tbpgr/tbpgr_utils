# encoding: utf-8

class String
  # convert windows path to cygwin path
  #
  # ==== Examples
  #
  #   'C:\hoge\hoge.txt'.winpath_to_cygwinpath # => '/cygdrive/c/hoge/hoge.txt'
  #
  def winpath_to_cygwinpath
    return self unless match(/\w:\\/)
    drive = scan(/(\w):\\/).first.first.downcase
    dir_file = scan(/\w:\\(.*)/).first.first.gsub('\\', '/')
    "/cygdrive/#{drive}/#{dir_file}"
  end
end
