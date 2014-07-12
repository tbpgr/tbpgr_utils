# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_fill do
    cases = [
      {
        case_no: 1,
        case_title: 'not use block case',
        inputs: [[*1..5], [*6..10]],
        fill_value: 99,
        method_name: :together_fill,
        expected: [[99, 99, 99, 99, 99], [99, 99, 99, 99, 99]],
        has_block: false
      },
      {
        case_no: 2,
        case_title: 'use block, no args case',
        inputs: [[*1..5], [*6..10]],
        fill_value: nil,
        method_name: :together_fill,
        expected: [[2, 3, 4, 5, 6], [2, 3, 4, 5, 6]],
        block_logic: '(i + 1) + 1',
        has_block: true
      },
      {
        case_no: 3,
        case_title: 'use block, has args case',
        inputs: [[*1..5], [*6..10]],
        fill_value: 2,
        method_name: :together_fill,
        expected: [[1, 2, 4, 5, 6], [6, 7, 4, 5, 6]],
        block_logic: '(i + 1) + 1',
        has_block: true
      },
      {
        case_no: 4,
        case_title: 'not use block case(alias tfill)',
        inputs: [[*1..5], [*6..10]],
        fill_value: 99,
        method_name: :tfill,
        expected: [[99, 99, 99, 99, 99], [99, 99, 99, 99, 99]],
        has_block: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_block]
            actual = c[:inputs].send c[:method_name], c[:fill_value] { |i|eval c[:block_logic], binding }
          else
            actual = c[:inputs].send c[:method_name], c[:fill_value]
          end

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
