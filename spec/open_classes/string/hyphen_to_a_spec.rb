# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do
  context :hyphen_to_a do
    cases = [
      {
        case_no: 1,
        case_title: 'number case case',
        input: '1-5',
        expected: [1, 2, 3, 4, 5]
      },
      {
        case_no: 2,
        case_title: 'alphabet case case',
        input: '"a"-"e"',
        expected: ['a', 'b', 'c', 'd', 'e']
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          # if c[:expect_error]
          #   lambda { c[:input].hyphen_to_a }.should raise_error(StandardError)
          #   next
          # end
          actual = c[:input].hyphen_to_a

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
