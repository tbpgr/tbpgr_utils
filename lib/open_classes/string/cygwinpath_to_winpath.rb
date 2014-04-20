# encoding: utf-8

class String
  # convert windows path to cygwin path
  #
  # ==== Examples
  #
  #   '/cygdrive/c/hoge/hoge.txt'.cygwinpath_to_winpath # => 'C:\hoge\hoge.txt'
  #
  def cygwinpath_to_winpath
    return self unless match(%r{/cygdrive/})
    drive = scan(%r{/cygdrive/(\w)/}).first.first.upcase
    dir_file = scan(%r{/cygdrive/\w/(.*)}).first.first.gsub('/', '\\')
    "#{drive}:\\#{dir_file}"
  end
end
