# encoding: utf-8

# Array
class Array
  # Arrays loop together.
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together do |first, second|
  #     print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
  #   end
  def together
    if_not_contain_array_rails_type_error
    first.each_with_index do |i_v, i|
      eval_each = []
      each_with_index do |j_v, j|
        eval_each << "self[#{j}][#{i}]"
      end
      eval_each_str = eval_each.join(',')
      instance_eval "yield(#{eval_each_str})"
    end
  end

  # Arrays loop together with index.
  #
  #   alpha = %w{one two three}
  #   numbers = %w{1 2 3}
  #   [alpha, numbers].together_with_index do |first, second, index|
  #     print "#{index.to_s}:#{first}:#{second}\n"  # => output 0:one:1, 1:two:2, 2:three:3
  #   end
  def together_with_index
    if_not_contain_array_rails_type_error
    first.each_with_index do |i_v, i|
      eval_each = []
      each_with_index do |j_v, j|
        eval_each << "self[#{j}][#{i}]"
      end
      eval_each << i
      eval_each_str = eval_each.join(',')
      instance_eval "yield(#{eval_each_str})"
    end
  end

  private

  def if_not_contain_array_rails_type_error
    each { |f|fail TypeError, "you have to use [Array1, Array2, ...] | #{f.class} is invalid" unless f.class == Array }
  end
end
