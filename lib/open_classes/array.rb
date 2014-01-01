# encoding: utf-8

# =Array
class Array
  # ==Arrays loop together
  def together
    self.each {|f|fail TypeError, "you have to use [Array1, Array2, ...] | #{f.class} is invalid" unless f.class == Array}
    self.first.each_with_index do |i_v, i|
      eval_each = []
      self.each_with_index do |j_v, j|
        eval_each << "self[#{j}][#{i}]"
      end
      eval_each_str = eval_each.join(",")
      instance_eval "yield(#{eval_each_str})"
    end
  end
end
