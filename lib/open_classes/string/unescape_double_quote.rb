# encoding: utf-8

class String
  # unescape double quote.
  #
  # ==== Examples
  #
  #   'hoge""hige'.unescape_double_quote # => 'hoge"hige'
  #
  def unescape_double_quote
    gsub('""', '"')
  end
end
