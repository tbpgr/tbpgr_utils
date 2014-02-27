# encoding: utf-8
require 'active_support/core_ext/object/inclusion'
require 'open_classes/string/heading_helper'

class String
  include HeadingHelper
  # Markdown
  MARKDOWN = '#'
  # Separator
  SEPARATOR = ' '

  # create heading string with Emmet-like syntax.
  #
  # ==== Examples
  #
  # > case
  #
  #   'hoge>hige'.to_markdown_heading # => '# hoge\n## hige'
  #
  # + case
  #
  #   'hoge+hige'.to_markdown_heading # => '# hoge\n# hige'
  #
  # ^ case
  #
  #   'hoge>hige^hege'.to_markdown_heading # => '# hoge\n## hige\n# hege'
  #
  def to_markdown_heading
    heading = to_heading
    to_markdown heading
  end

  private
    def to_markdown(heading)
      to_head(heading, MARKDOWN, separator: SEPARATOR, start_level: 1)
    end
end
