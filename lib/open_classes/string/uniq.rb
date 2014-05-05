# encoding: utf-8

class String
  # return uniq string
  #
  # ==== Examples
  #
  #   'abcdac'.uniq # => 'abcd'
  #
  def uniq
    split('').uniq.join
  end
end
