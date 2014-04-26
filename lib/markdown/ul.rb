# encoding: utf-8

class MarkdownString
  # Return markdown ul from text
  #
  # === Example
  #
  # case list
  #
  #   MarkdownString.ul(%w{a b c})
  #
  # result
  #
  #   * a
  #   * b
  #   * c
  #
  # case not list
  #
  #   MarkdownString.ul("test") # => "test"
  #
  # case nil list
  #
  #   MarkdownString.ul([nil, nil])
  #
  # result
  #
  #   *
  #   *
  #
  # case empty list
  #
  #   MarkdownString.ul([]) # => ""
  #
  def self.ul(list)
    return list unless list.is_a?(Array)
    return '' if list.empty?
    list.reduce([]) do |ret, elm|
      elm = '' if elm.nil?
      ret << "* #{elm}"
      ret
    end.join("\n") + "\n"
  end
end
