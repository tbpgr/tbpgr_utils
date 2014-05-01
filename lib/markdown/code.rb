# encoding: utf-8

class MarkdownString
  # Return markdown code from text
  #
  # === Example
  #
  #   MarkdownString.code('print "hoge"') # => '`print "hoge"`'
  #
  def self.code(text)
    return '``' if text.nil?
    return text unless text.is_a?(String)
    return '``' if text.empty?
    "`#{text}`"
  end
end
