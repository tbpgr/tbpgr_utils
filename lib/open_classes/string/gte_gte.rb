# encoding: utf-8
require 'tbpgr_utils'

# String
class String
  # self convert to Array. execute each elements
  #
  # === Example
  #
  #   "abc".>> :next # => 'bcd'
  #   "abc".>> :+, "a" # => 'adbdcd'
  #
  def >>(method_name, *args)
    return self unless [Symbol, String, Proc].include? method_name.class
    array_context = split('').>>
    rets =
      if args.size.nil? || args.size == 0
        array_context.send method_name
      else
        array_context.send method_name, *args
      end
    rets.join
  end
end
