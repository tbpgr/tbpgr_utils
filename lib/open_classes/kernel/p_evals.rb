# encoding: utf-8
require 'open_classes/string'

# Kernel
module Kernel
  # Print code + eval result
  #
  #   print_eval 8/4, binding  # => 8/4 # => 2
  #   message = 'msg';print_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"
  def print_eval(code, binding)
    print exec_eval code, binding
  end

  # Puts code + eval result
  #
  #   puts_eval 8/4, binding  # => 8/4 # => 2\n
  #   message = 'msg';puts_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"\n
  def puts_eval(code, binding)
    puts exec_eval code, binding
  end

  # Puts each-line-code + eval result
  #
  # code
  #   message = 'msg'
  #   puts_eval binding, <<-EOS
  #   "hoge-#{message}1"
  #   "hoge-#{message}2"
  #   EOS
  #
  # result
  #   "hoge-#{message}1" # => "hoge-msg1"\n
  #   "hoge-#{message}2" # => "hoge-msg2"\n
  def bulk_puts_eval(binding, codes)
    result = []
    codes.each_line { |code|result << exec_eval(code.chop, binding) }
    puts result.join("\n").justify_char '#'
  end

  private
  def exec_eval(code, binding)
    ret = eval code, binding
    "#{code} # => #{ret.inspect}"
  end
end
