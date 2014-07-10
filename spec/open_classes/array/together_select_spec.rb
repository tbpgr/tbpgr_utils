# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_select do
    cases = [
      {
        case_no: 1,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: 'first == second',
        method_name: :together_select,
        expected: [[2, 3], [2, 3]]
      },
      {
        case_no: 2,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :together_select
      },
      {
        case_no: 3,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :tselect
      },
      {
        case_no: 4,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :together_find_all
      },
      {
        case_no: 5,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        condition: '[first.odd?, second.even?]',
        expected: [[1, 3], [4, 2]],
        method_name: :tfindall
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:inputs].method(c[:method_name]).call { |first, second| eval c[:condition], binding }

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
