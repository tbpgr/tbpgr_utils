# encoding: utf-8

# Object
class Object
  # If self match any one of args, return true.
  #
  #   "hoge".any_of? %w{hoge hige} # => true
  #   "hige".any_of? %w{hoge hige} # => true
  #   "hege".any_of? %w{hoge hige} # => false
  def any_of?(*args)
    args.include?(self)
  end
end
