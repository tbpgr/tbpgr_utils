# encoding: utf-8
require 'active_support/core_ext/object/inclusion'
require 'open_classes/string/heading_helper'

class String
  include HeadingHelper
  # Space2
  SPACE2 = '  '

  # create heading string with Emmet-like syntax.
  #
  # ==== Examples
  #
  # > case
  #
  #   'hoge>hige'.to_space2_heading # => 'hoge\n  hige'
  #
  # + case
  #
  #   'hoge+hige'.to_space2_heading # => 'hoge\nhige'
  #
  # ^ case
  #
  #   'hoge>hige^hege'.to_space2_heading # => 'hoge\n  hige\nhege'
  #
  def to_space2_heading
    heading = to_heading
    to_space2 heading
  end

  private
  def to_space2(heading)
    to_head(heading, SPACE2)
  end
end
