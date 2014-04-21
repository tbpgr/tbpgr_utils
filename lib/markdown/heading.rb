# encoding: utf-8

class MarkdownString
  # Return markdown heading level1 from text
  #
  # === Example
  #
  #   MarkdownString.heading1("title") # => "# title"
  #   MarkdownString.heading1("") # => "# "
  #   MarkdownString.heading1(nil) # => "# "
  #   MarkdownString.heading1(12345) # => "# 12345"
  #
  def self.heading1(text)
    return '# ' if text.nil?
    return '# ' if text.respond_to?(:empty) && text.empty?
    "# #{text.to_s}"
  end
end
