# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_first do
    cases = [
      {
        case_no: 1,
        case_title: 'not args case',
        inputs: [[*1..5], [*6..10]],
        method_name: :together_first,
        expected: [1, 6],
        has_args: false
      },
      {
        case_no: 2,
        case_title: 'has args 2 case',
        inputs: [[*1..5], [*6..10]],
        args: 2,
        method_name: :together_first,
        expected: [[1, 2], [6, 7]],
        has_args: true
      },
      {
        case_no: 3,
        case_title: 'has args 0 case',
        inputs: [[*1..5], [*6..10]],
        args: 0,
        method_name: :together_first,
        expected: [[], []],
        has_args: true
      },
      {
        case_no: 4,
        case_title: 'has args over size case',
        inputs: [[*1..5], [*6..10]],
        args: 6,
        method_name: :together_first,
        expected: [[*1..5], [*6..10]],
        has_args: true
      },
      {
        case_no: 5,
        case_title: 'not args case(alias tfirst)',
        inputs: [[*1..5], [*6..10]],
        method_name: :tfirst,
        expected: [1, 6],
        has_args: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_args]
            actual = c[:inputs].send c[:method_name], c[:args]
          else
            actual = c[:inputs].send c[:method_name]
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
