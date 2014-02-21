# encoding: utf-8

# String
class String
  # say string.
  #
  # ==== Options
  #
  # * <tt>option</tt> - quote, dquote, bracket, hyphen
  #
  # ==== Examples
  #
  # default case
  #
  #   'hoge'.say # => 'hoge'
  #
  # quote case
  #
  #   'hoge'.say(:quote) # => 'hoge'
  #
  # dquote case
  #
  #   'hoge'.say(:dquote) # => "hoge"
  #
  # bracket case
  #
  #   'hoge'.say(:bracket) # => [hoge]
  #
  # hyphen case
  #
  #   'hoge'.say(:hyphen) # => -hoge-
  #
  def say(option = :quote)
    case option
    when :quote
      "'#{self}'"
    when :dquote
      "\"#{self}\""
    when :bracket
      "[#{self}]"
    when :hyphen
      "-#{self}-"
    else
      fail ArgumentError, "invalid value #{option}"
    end
  end
end
