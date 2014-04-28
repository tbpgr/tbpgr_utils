# encoding: utf-8

class MarkdownString
  # Return markdown bold from text
  #
  # === Example
  #
  # case list
  #
  #   MarkdownString.bold("hoge") # '**hoge**'
  #   MarkdownString.bold("") # '****'
  #   MarkdownString.bold(nil) # '****'
  #
  def self.bold(text)
    return '****' if text.nil?
    return text unless text.is_a?(String)
    return '****' if text.empty?
    "**#{text}**"
  end
end
