# encoding: utf-8

class String
  # escape double quote.
  #
  # ==== Examples
  #
  #   'hoge"hige'.escape_double_quote # => 'hoge""hige'
  #
  def escape_double_quote
    gsub('"', '""')
  end
end
