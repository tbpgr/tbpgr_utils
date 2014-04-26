# encoding: utf-8

class MarkdownString
  # Return markdown ol from text
  #
  # === Example
  #
  # case list
  #
  #   MarkdownString.ol(%w{a b c})
  #
  # resolt
  #
  #   1. a
  #   1. b
  #   1. c
  #
  # case not list
  #
  #   MarkdownString.ol("test") # => "test"
  #
  # case nil list
  #
  #   MarkdownString.ol([nil, nil])
  #
  # resolt
  #
  #   1.
  #   1.
  #
  # case empty list
  #
  #   MarkdownString.ol([]) # => ""
  #
  def self.ol(list)
    return list unless list.is_a?(Array)
    return '' if list.empty?
    list.reduce([]) do |ret, elm|
      elm = '' if elm.nil?
      ret << "1. #{elm}"
      ret
    end.join("\n") + "\n"
  end
end
