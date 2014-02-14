# encoding: utf-8
require 'spec_helper'
require 'active_support/core_ext/object/inclusion'
require 'tbpgr_utils'

describe Array do
  context :together_sample do
    cases = [
      {
        case_no: 1,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_sample',
        expected_first: 'actual[0].in? [1, 2]',
        expected_second: 'actual[1].in? [5, 6]',
      },
      {
        case_no: 2,
        case_title: 'one empty case',
        inputs: [[1, 2], []],
        method_name: 'together_sample',
        expected_first: 'actual[0].in? [1, 2]',
        expected_second: 'actual[1].nil?',
      },
      {
        case_no: 3,
        case_title: 'both empty case',
        inputs: [[], []],
        method_name: 'together_sample',
        expected_first: 'actual[0].nil?',
        expected_second: 'actual[1].nil?',
      },
      {
        case_no: 4,
        case_title: 'not empty, has args case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_sample',
        args: 2,
        expected_size: 2,
        expected_first: 'f.in? [1, 2]',
        expected_second: 's.in? [5, 6]',
        has_args: true,
      },
      {
        case_no: 5,
        case_title: 'both empty, has args case',
        inputs: [[], []],
        method_name: 'together_sample',
        args: 2,
        expected_size: 0,
        expected_ret: [[], []],
        expected_self: [[], []],
        has_args: true,
      },
      {
        case_no: 6,
        case_title: 'not empty, over size, has args case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_sample',
        args: 3,
        expected_size: 2,
        expected_first: 'f.in? [1, 2]',
        expected_second: 's.in? [5, 6]',
        has_args: true,
      },
      {
        case_no: 7,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'tsample',
        expected_first: 'actual[0].in? [1, 2]',
        expected_second: 'actual[1].in? [5, 6]',
      },
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
            # -- then --
            actual[0].each do |f|
              first_ret = eval c[:expected_first], binding
              expect(first_ret).to be_true
            end
            expect(actual[0].size).to eq(c[:expected_size])

            actual[1].each do |s|
              second_ret = eval c[:expected_second], binding
              expect(second_ret).to be_true
            end
            expect(actual[1].size).to eq(c[:expected_size])
          else
            actual = c[:inputs].send c[:method_name]
            # -- then --
            first_ret = eval c[:expected_first], binding
            expect(first_ret).to be_true
            second_ret = eval c[:expected_second], binding
            expect(second_ret).to be_true
          end

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
