# encoding: utf-8
require 'active_support/core_ext/object/inclusion'

# HeadingHelper
module HeadingHelper
  private
    def to_heading
      self_chars = chars
      level, index, word_ret, ret = 0, 0, [], []
      self_chars.each_with_index do |v, index|
        key_word = v.in? %w{> + ^}

        if key_word
          ret << leveled_word(level, word_ret)
          level += v == '+' ? 0 : v == '>' ? 1 : -1
          word_ret = []
        else
          word_ret << v
        end
      end
      ret << leveled_word(level, word_ret)
    end

    def leveled_word(level, words)
      word = {}
      word[:level] = level
      word[:word] = words.join
      word
    end

    def to_head(heading, head_char, options = { separator: '', start_level: 0 })
      heading.reduce([]) do |ret, value|
        repeat = (value[:level] + options[:start_level])
        ret << "#{head_char * repeat}#{options[:separator]}#{value[:word]}"
      end.join("\n")
    end
end
