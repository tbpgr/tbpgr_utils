# encoding: utf-8

class String
  # unescape single quote.
  #
  # ==== Examples
  #
  #   "hoge''h''ige".unescape_quote # => "hoge'hige"
  #
  def unescape_quote
    gsub("''", "'")
  end
end
