# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_reverse do
    cases = [
      {
        case_no: 1,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_reverse',
        expected_ret: [[2, 1], [6, 5]],
        expected_self: [[1, 2], [5, 6]],
      },
      {
        case_no: 2,
        case_title: 'one empty case',
        inputs: [[1, 2], []],
        method_name: 'together_reverse',
        expected_ret: [[2, 1], []],
        expected_self: [[1, 2], []],
      },
      {
        case_no: 3,
        case_title: 'not empty case(alias treverse)',
        inputs: [[1, 2], [5, 6]],
        method_name: 'treverse',
        expected_ret: [[2, 1], [6, 5]],
        expected_self: [[1, 2], [5, 6]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name]

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

  context :together_reverse! do
    cases = [
      {
        case_no: 1,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_reverse!',
        expected_ret: [[2, 1], [6, 5]],
        expected_self: [[2, 1], [6, 5]],
      },
      {
        case_no: 2,
        case_title: 'one empty case',
        inputs: [[1, 2], []],
        method_name: 'together_reverse!',
        expected_ret: [[2, 1], []],
        expected_self: [[2, 1], []],
      },
      {
        case_no: 3,
        case_title: 'not empty case(alias treverse!)',
        inputs: [[1, 2], [5, 6]],
        method_name: 'treverse!',
        expected_ret: [[2, 1], [6, 5]],
        expected_self: [[2, 1], [6, 5]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name]

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
