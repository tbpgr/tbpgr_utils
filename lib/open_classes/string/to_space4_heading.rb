# encoding: utf-8
require 'active_support/core_ext/object/inclusion'
require 'open_classes/string/heading_helper'

class String
  include HeadingHelper
  # Space4
  SPACE4 = '    '

  # create heading string with Emmet-like syntax.
  #
  # ==== Examples
  #
  # > case
  #
  #   'hoge>hige'.to_space4_heading # => 'hoge\n    hige'
  #
  # + case
  #
  #   'hoge+hige'.to_space4_heading # => 'hoge\nhige'
  #
  # ^ case
  #
  #   'hoge>hige^hege'.to_space4_heading # => 'hoge\n    hige\nhege'
  #
  def to_space4_heading
    heading = to_heading
    to_space4 heading
  end

  private
  def to_space4(heading)
    to_head(heading, SPACE4)
  end
end
