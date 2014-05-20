# encoding: utf-8
require 'spec_helper'
require 'open_classes/integer/each_digit_with_index'

describe Integer do
  context :each_digit_with_index do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: 12_345,
        expected: [1, 3, 5, 7, 9],
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
          c[:input].each_digit_with_index { |v, i|actual << v + i }

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
