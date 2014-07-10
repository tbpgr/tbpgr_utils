# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_shift do
    cases = [
      {
        case_no: 1,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_shift',
        expected_ret: [1, 5],
        expected_self: [[2], [6]]
      },
      {
        case_no: 2,
        case_title: 'one empty case',
        inputs: [[1, 2], []],
        method_name: 'together_shift',
        expected_ret: [1, nil],
        expected_self: [[2], []]
      },
      {
        case_no: 3,
        case_title: 'both empty case',
        inputs: [[], []],
        method_name: 'together_shift',
        expected_ret: [nil, nil],
        expected_self: [[], []]
      },
      {
        case_no: 4,
        case_title: 'not empty, has args case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_shift',
        args: 2,
        expected_ret: [[1, 2], [5, 6]],
        expected_self: [[], []],
        has_args: true
      },
      {
        case_no: 5,
        case_title: 'one empty, has args case',
        inputs: [[1, 2], []],
        method_name: 'together_shift',
        args: 2,
        expected_ret: [[1, 2], []],
        expected_self: [[], []],
        has_args: true
      },
      {
        case_no: 6,
        case_title: 'both empty, has args case',
        inputs: [[], []],
        method_name: 'together_shift',
        args: 2,
        expected_ret: [[], []],
        expected_self: [[], []],
        has_args: true
      },
      {
        case_no: 7,
        case_title: 'not empty case(alias tshift)',
        inputs: [[1, 2], [5, 6]],
        method_name: 'tshift',
        expected_ret: [1, 5],
        expected_self: [[2], [6]]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = \
            if c[:has_args]
              c[:inputs].send c[:method_name], c[:args]
            else
              c[:inputs].send c[:method_name]
            end

          # -- then --
          expect(actual).to eq(c[:expected_ret])
          expect(c[:inputs]).to eq(c[:expected_self])
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
