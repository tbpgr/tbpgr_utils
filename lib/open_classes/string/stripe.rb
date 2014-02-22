# encoding: utf-8

# String
class String
  # stripe string.
  #
  # ==== Options
  #
  # * <tt>:lower_cap</tt> - start lower char.
  #
  # ==== Examples
  #
  # default case
  #
  #   'hoge'.stripe # => HoGe
  #
  # lower_cap case
  #
  #   'hoge'.stripe :lower_cap # => hOgE
  #
  # empty case
  #
  #   ''.stripe # => ''
  #
  # nil case
  #
  #   hoge = nil
  #   hoge.stripe # => nil
  #
  def stripe(cap = :upper_cap)
    updowns = %w{upcase downcase}
    index = cap == :lower_cap ? 1 : 0
    chars.reduce([]) do |ret, char|
      ret << char.send(updowns[index % 2])
      index += 1
      ret
    end.join
  end
end

class NilClass
  def stripe
    nil
  end
end
