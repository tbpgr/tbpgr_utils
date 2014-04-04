# encoding: utf-8

# String
class String
  # get spacing string
  #
  # === Example
  #
  # input
  #   hoge = 'hoge'
  #   hoge.spacing # => 'h o g e'
  #   hoge.spacing({char: '_', size: 2}) # => 'h__o__g__e'
  #
  def spacing(options = {char: ' ', size: 1})
    options[:char] = ' ' unless options[:char]
    options[:size] = 1 unless options[:size]
    self.chars.to_a.join(options[:char] * options[:size])
  end
end

