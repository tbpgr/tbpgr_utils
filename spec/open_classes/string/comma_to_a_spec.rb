# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do
  context :comma_to_a do
    cases = [
      {
        case_no: 1,
        case_title: 'space commma case',
        input: '1, 5, 9',
        expected: ['1', '5', '9']
      },
      {
        case_no: 2,
        case_title: 'commma case',
        input: '1,5,9',
        expected: ['1', '5', '9']
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].comma_to_a

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
