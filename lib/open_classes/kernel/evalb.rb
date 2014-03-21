# encoding: utf-8

# Kernel
module Kernel
  # eval block version
  #
  # === Example
  #
  #   require 'tbpgr_utils'
  #   n = 1
  #   actual = evalb(binding) do
  #     <<-EOS
  #   n = n + 1
  #   n = n + 2
  #        EOS
  #   end
  #
  #   print actual # => 4
  def evalb(bind = nil, &proc)
    eval yield, bind
  end
end
