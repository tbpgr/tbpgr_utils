# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_index do
    cases = [
      {
        case_no: 1,
        case_title: 'both index exist case',
        inputs: [[*1..5], [*5..9]],
        value: 5,
        method_name: :together_index,
        expected: [4, 0]
      },
      {
        case_no: 2,
        case_title: 'one index exist case',
        inputs: [[*1..5], [*5..9]],
        value: 4,
        method_name: :together_index,
        expected: [3, nil]
      },
      {
        case_no: 3,
        case_title: 'both not exist index case',
        inputs: [[*1..5], [*5..9]],
        value: 10,
        method_name: :together_index,
        expected: [nil, nil]
      },
      {
        case_no: 4,
        case_title: 'both index exist case(alias tindex)',
        inputs: [[*1..5], [*5..9]],
        value: 5,
        method_name: :tindex,
        expected: [4, 0]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name], c[:value]

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
