# encoding: utf-8
require 'spec_helper'
require 'active_support/core_ext/object/inclusion'
require 'tbpgr_utils'

describe Array do
  context :together_slice do
    cases = [
      {
        case_no: 1,
        case_title: 'single args case',
        inputs: [[*1..5], [*6..10]],
        method_name: 'together_slice',
        args1: 2,
        expected: [3, 8]
      },
      {
        case_no: 2,
        case_title: 'multi args case',
        inputs: [[*1..5], [*6..10]],
        method_name: 'together_slice',
        args1: 2,
        args2: 2,
        expected: [[3, 4], [8, 9]]
      },
      {
        case_no: 3,
        case_title: 'range args case',
        inputs: [[*1..5], [*6..10]],
        method_name: 'together_slice',
        args1: (2..3),
        expected: [[3, 4], [8, 9]]
      },
      {
        case_no: 4,
        case_title: 'single args case(alias tslice)',
        inputs: [[*1..5], [*6..10]],
        method_name: 'tslice',
        args1: 2,
        expected: [3, 8]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:args2]
            actual = c[:inputs].send c[:method_name], c[:args1], c[:args2]
          else
            actual = c[:inputs].send c[:method_name], c[:args1]
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
