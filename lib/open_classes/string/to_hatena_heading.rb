# encoding: utf-8
require 'active_support/core_ext/object/inclusion'
require 'open_classes/string/heading_helper'

class String
  include HeadingHelper
  # Hatena
  HATENA = '*'

  # create heading string with Emmet-like syntax.
  #
  # ==== Examples
  #
  # > case
  #
  #   'hoge>hige'.to_hatena_heading # => '*hoge\n**hige'
  #
  # + case
  #
  #   'hoge+hige'.to_hatena_heading # => '*hoge\n*hige'
  #
  # ^ case
  #
  #   'hoge>hige^hege'.to_hatena_heading # => '*hoge\n**hige\n*hege'
  #
  def to_hatena_heading
    heading = to_heading
    to_hatena heading
  end

  private
  def to_hatena(heading)
    to_head(heading, HATENA, start_level: 1)
  end
end
