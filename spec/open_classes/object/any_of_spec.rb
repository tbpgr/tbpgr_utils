# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Object do
  context :any_of? do
    cases = [
      {
        case_no: 1,
        case_title: 'true case',
        input: 'hoge',
        check: %w(hoge hige),
        expected: true
      },
      {
        case_no: 2,
        case_title: 'true case',
        input: 'hige',
        check: %w(hoge hige),
        expected: true
      },
      {
        case_no: 3,
        case_title: 'false case',
        input: 'hege',
        check: %w(hoge hige),
        expected: false
      },
      {
        case_no: 4,
        case_title: 'number true case',
        input: 1,
        check: [1, 2, 3, 4, 5],
        expected: true
      },
      {
        case_no: 5,
        case_title: 'number true case',
        input: 6,
        check: [1, 2, 3, 4, 5],
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].any_of?(*c[:check])

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
