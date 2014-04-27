# encoding: utf-8

class MarkdownString
  # Return markdown italic from text
  #
  # === Example
  #
  # case list
  #
  #   MarkdownString.italic(%w{a b c})
  #
  # resitalict
  #
  #   * a
  #   * b
  #   * c
  #
  # case not list
  #
  #   MarkdownString.italic("test") # => "test"
  #
  # case nil list
  #
  #   MarkdownString.italic([nil, nil])
  #
  # resitalict
  #
  #   *
  #   *
  #
  # case empty list
  #
  #   MarkdownString.italic([]) # => ""
  #
  def self.italic(text)
    return '**' if text.nil?
    return text unless text.is_a?(String)
    return '**' if text.empty?
    "*#{text}*"
  end
end
