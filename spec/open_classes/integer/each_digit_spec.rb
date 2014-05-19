# encoding: utf-8
require 'spec_helper'
require 'open_classes/integer/each_digit'

describe Integer do
  context :each_digit do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: 12_345,
        expected: [2, 3, 4, 5, 6],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = []
          c[:input].each_digit { |v|actual << v + 1 }

          # -- then --
          expect(actual).to eq(c[:expected])
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
