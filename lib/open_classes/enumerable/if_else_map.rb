# encoding: utf-8

# Enumerable
module Enumerable
  # === Example
  #
  #   [*1..4].if_else_map(:odd?.to_proc,->(odd){'奇数'},->(even){'偶数'}) # => ['奇数','偶数','奇数','偶数']
  #
  def if_else_map(predicate,proc_t,proc_f)
    map{|e|predicate.call(e) ? proc_t.call(e) : proc_f.call(e)}
  end
end
