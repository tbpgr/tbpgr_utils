# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :exchange! do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        input: [*1..6],
        one_index: 1,
        other_index: 5,
        expected: [1, 6, 3, 4, 5, 2]
      },
      {
        case_no: 2,
        case_title: 'minus case',
        input: [*1..6],
        one_index: 1,
        other_index: -1,
        expected: [1, 6, 3, 4, 5, 2]
      },
      {
        case_no: 3,
        case_title: 'out of range case',
        input: [*1..6],
        one_index: 1,
        other_index: 6,
        expected: [*1..6]
      },
      {
        case_no: 4,
        case_title: 'out of range(minus) case',
        input: [*1..6],
        one_index: 1,
        other_index: -6,
        expected: [*1..6]
      },
      {
        case_no: 5,
        case_title: 'empty case',
        input: [],
        one_index: 1,
        other_index: 6,
        expected: []
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:input].exchange! c[:one_index], c[:other_index]

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
