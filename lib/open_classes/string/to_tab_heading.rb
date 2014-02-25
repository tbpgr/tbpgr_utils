# encoding: utf-8
require 'active_support/core_ext/object/inclusion'
require 'open_classes/string/heading_helper'

class String
  include HeadingHelper
  # Tab
  TAB = "\t"

  # create heading string with Emmet-like grammar.
  #
  # ==== Examples
  #
  # > case
  #
  #   'hoge>hige'.to_tab_heading # => 'hoge\n\thige'
  #
  # + case
  #
  #   'hoge+hige'.to_tab_heading # => 'hoge\nhige'
  #
  # ^ case
  #
  #   'hoge>hige^hege'.to_tab_heading # => 'hoge\n\thige\nhege'
  #
  def to_tab_heading
    heading = to_heading
    to_tab heading
  end

  private
    def to_tab(heading)
      to_head(heading, TAB)
    end
end
