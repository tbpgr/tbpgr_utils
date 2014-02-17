# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'

describe Kernel do
  context :aa_ancestors do
    class BaseHogeForAncestors; end
    class HogeForAncestors < BaseHogeForAncestors; end

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        expected: <<-EOS
------------------------------------------------
|                 BasicObject                  |
------------------------------------------------
                       |
------------------------------------------------
|                    Kernel                    |
------------------------------------------------
                       |
------------------------------------------------
|JSON::Ext::Generator::GeneratorMethods::Object|
------------------------------------------------
                       |
------------------------------------------------
|               PP::ObjectMixin                |
------------------------------------------------
                       |
------------------------------------------------
|                    Object                    |
------------------------------------------------
                       |
------------------------------------------------
|             BaseHogeForAncestors             |
------------------------------------------------
                       |
------------------------------------------------
|               HogeForAncestors               |
------------------------------------------------
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message = c[:bind] if c[:bind]

          # -- when --
          actual = HogeForAncestors.aa_ancestors

          # -- then --
          expect(actual).to eq(c[:expected].chomp)
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
