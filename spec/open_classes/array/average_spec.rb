# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :average do
    cases = [
      {
        case_no: 1,
        case_title: 'numbers(integer) case',
        input: [*1..6],
        expected: 3.5,
      },
      {
        case_no: 2,
        case_title: 'numbers(float) case',
        input: [1.5, 2.5],
        expected: 2.0,
      },
      {
        case_no: 3,
        case_title: 'not numbers case',
        input: [*'a'..'z'],
        expect_error: true,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          if c[:expect_error]
            lambda { c[:input].average }.should raise_error(StandardError)
            next
          else
            actual = c[:input].average
          end

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
