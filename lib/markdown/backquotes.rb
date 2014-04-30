# encoding: utf-8

class MarkdownString
  # Return markdown backquotes from text
  #
  # === Example
  #
  #   MarkdownString.backquotes "hoge\nhige\nhage\n"
  #
  # result
  #
  #   >hoge
  #   >hige
  #   >hage
  #
  def self.backquotes(text)
    return '>' if text.nil?
    return text unless text.is_a?(String)
    return '>' if text.empty?
    text.split("\n").reduce([]) do |ret, elm|
      ret << ">#{elm}  "
      ret
    end.join("\n") + "\n"
  end
end
