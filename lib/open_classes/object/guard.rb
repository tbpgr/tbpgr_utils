# encoding: utf-8

# Object
class Object
  # guard condition
  #
  # === Param
  #
  # * <tt>:condition</tt> - guard condition
  #
  # === Example
  #
  # guard return case
  #
  #   def hoge(msg)
  #     guard(msg.nil?) {return "guard"}
  #     "not guard"
  #   end
  #
  #   hoge true # => "guard"
  #   hoge false # => "not guard"
  #
  # guard fail case
  #
  #   def hoge(msg)
  #     guard(msg.nil?) {fail ArgumentError, 'error!!'}
  #     "not guard"
  #   end
  #
  #   hoge true # => raise ArgumentError. message = error!!
  #   hoge false # => "not guard"
  def guard(condition)
    yield if condition
  end

  # unless_guard condition
  #
  # === Param
  #
  # * <tt>:condition</tt> - guard condition
  #
  # === Example
  #
  # unless_guard return case
  #
  #   def hoge(msg)
  #     unless_guard(msg.nil?) {return "unless_guard"}
  #     "not unless_guard"
  #   end
  #
  #   hoge false # => "unless_guard"
  #   hoge true # => "not unless_guard"
  #
  # unless_guard fail case
  #
  #   def hoge(msg)
  #     unless_guard(msg.nil?) {fail ArgumentError, 'error!!'}
  #     "not unless_guard"
  #   end
  #
  #   hoge false # => raise ArgumentError. message = error!!
  #   hoge true # => "not unless_guard"
  def unless_guard(condition)
    yield unless condition
  end
end
