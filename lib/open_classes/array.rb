# encoding: utf-8

# Array
class Array
  # Arrays loop together
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together do |first, second|
  #     print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
  #   end
  def together
    each { |f|fail TypeError, "you have to use [Array1, Array2, ...] | #{f.class} is invalid" unless f.class == Array }
    first.each_with_index do |i_v, i|
      eval_each = []
      each_with_index do |j_v, j|
        eval_each << "self[#{j}][#{i}]"
      end
      eval_each_str = eval_each.join(',')
      instance_eval "yield(#{eval_each_str})"
    end
  end
end
