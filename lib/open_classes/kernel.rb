# encoding: utf-8

# Kernel
module Kernel
  # Print code + eval result
  #
  #  print_eval 8/4, binding  # => 8/4 # => 2
  #  message = 'msg';print_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"
  def print_eval(code, binding)
    print exec_eval code, binding
  end

  # Puts code + eval result
  #
  #  puts_eval 8/4, binding  # => 8/4 # => 2\n
  #  message = 'msg';puts_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"\n
  def puts_eval(code, binding)
    puts exec_eval code, binding
  end

  def exec_eval(code, binding)
    ret = eval code, binding
    "#{code} # => #{ret.inspect}"
  end
  private :exec_eval
end
