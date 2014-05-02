# encoding: utf-8

class MarkdownString
  # Return markdown codes from text
  #
  # === Example
  #
  #   MarkdownString.codes("class Hoge\n  def hoge\n    'hoge'\n  end\nend\n")
  #
  # result
  #
  #   ~~~ruby
  #   class Hoge
  #     def hoge
  #       'hoge'
  #     end
  #   end
  #   ~~~
  #
  def self.codes(text, lang = nil)
    lang = '' if lang.nil?
    text = '' if text.nil?
    return text unless text.is_a?(String)
    "~~~#{lang}\n#{text}~~~\n"
  end
end
