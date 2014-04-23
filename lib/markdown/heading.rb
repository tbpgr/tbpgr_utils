# encoding: utf-8

class MarkdownString
  class << self
    # Return markdown heading level1-6 from text
    #
    # === Example
    #
    #   MarkdownString.heading1("title") # => "# title"
    #   MarkdownString.heading2("title") # => "## title"
    #   MarkdownString.heading3("title") # => "### title"
    #   MarkdownString.heading4("title") # => "#### title"
    #   MarkdownString.heading5("title") # => "##### title"
    #   MarkdownString.heading6("title") # => "###### title"
    #   MarkdownString.heading1("") # => "# "
    #   MarkdownString.heading1(nil) # => "# "
    #   MarkdownString.heading1(12345) # => "# 12345"
    #
    [*1..6].each do |i|
      define_method "heading#{i.to_s}".to_sym do |text|
        heading(text, i)
      end
    end
  end

  private
    def self.heading(text, level)
      return '#' * level + ' ' if text.nil?
      return '#' * level + ' ' if text.respond_to?(:empty) && text.empty?
      '#' * level + " #{text.to_s}"
    end
end
