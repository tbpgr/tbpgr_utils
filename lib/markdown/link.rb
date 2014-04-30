# encoding: utf-8

class MarkdownString
  # Return markdown link from label and url
  #
  # === Example
  #
  # case list
  #
  #   MarkdownString.link 'label', 'http://hogehogehoge.com'
  #
  # result
  #
  #   '[label](http://hogehogehoge.com)'
  #
  def self.link(label, url)
    label = '' if label.nil?
    url = '' if url.nil?
    return label unless label.is_a?(String)
    return url unless url.is_a?(String)
    "[#{label}](#{url})"
  end
end
