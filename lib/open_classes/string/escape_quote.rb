# encoding: utf-8

class String
  # escape double quote.
  #
  # ==== Examples
  #
  #   "hoge'hige".escape_quote # => "hoge''hige"
  #
  def escape_quote
    gsub("'", "''")
  end
end
