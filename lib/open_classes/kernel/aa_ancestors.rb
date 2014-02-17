# encoding: utf-8
require 'open_classes/string'

# Kernel
module Kernel
  # Ascii Art Ancestors
  #
  # === Examples
  #
  # define class
  #
  #   class BaseHogeForAncestors;end
  #   class HogeForAncestors < BaseHogeForAncestors;end
  #
  # execute aa_ancestors
  #
  #   puts HogeForAncestors.aa_ancestors
  #
  # result is ...
  #
  #   ----------------------
  #   |     BasicObject    |
  #   ----------------------
  #             |
  #   ----------------------
  #   |       Kernel       |
  #   ----------------------
  #             |
  #   ----------------------
  #   |       Object       |
  #   ----------------------
  #             |
  #   ----------------------
  #   |BaseHogeForAncestors|
  #   ----------------------
  #             |
  #   ----------------------
  #   |  HogeForAncestors  |
  #   ----------------------
  def aa_ancestors
    max_class = max_size_class
    max = max_class.to_s.size
    ca = centered_ancestors(max)
    ba = surrounded_ancestors(ca)
    connected_box_ancestors(ba, max)
  end

  private

    def max_size_class
      ancestors.max_by { |v|v.to_s.size }
    end

    def centered_ancestors(max)
      ancestors.reverse.map { |v|v.to_s.center max }
    end

    def surrounded_ancestors(ca)
      ca.reduce([]) { |ret, k|ret << k.surround }
    end

    def connected_box_ancestors(ba, max)
      ba.join(ancestors_connector(max))
    end

    def ancestors_connector(max)
      connector = '|'.rjust((max + 2) / 2)
      "\n#{connector}\n"
    end
end
