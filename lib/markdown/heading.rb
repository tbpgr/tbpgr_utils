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
    heading(text, 1)
  end

  # Return markdown heading level2 from text
  #
  # === Example
  #
  #   MarkdownString.heading2("title") # => "## title"
  #   MarkdownString.heading2("") # => "## "
  #   MarkdownString.heading2(nil) # => "## "
  #   MarkdownString.heading2(12345) # => "## 12345"
  #
  def self.heading2(text)
    heading(text, 2)
  end

  private
    def self.heading(text, level)
      return '#' * level + ' ' if text.nil?
      return '#' * level + ' ' if text.respond_to?(:empty) && text.empty?
      '#' * level + " #{text.to_s}"
    end
end
