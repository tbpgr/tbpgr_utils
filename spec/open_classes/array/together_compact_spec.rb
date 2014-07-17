# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_compact do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :together_compact,
        expected_self: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']]
      },
      {
        case_no: 2,
        case_title: 'valid case(use alias tcompact)',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :tcompact,
        expected_self: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']]
      }
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
          expect(c[:inputs]).to eq(c[:expected_self])
          expect(actual).to eq(c[:expected_ret])
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

  context :together_compact! do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :together_compact!,
        expected_self: [[1, 2, 3], ['a', 'b', 'c', 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']]
      },
      {
        case_no: 2,
        case_title: 'valid case(use alias tcompact)',
        inputs: [[1, 2, nil, 3], ['a', 'b', 'c', nil, 'd']],
        method_name: :tcompact!,
        expected_self: [[1, 2, 3], ['a', 'b', 'c', 'd']],
        expected_ret: [[1, 2, 3], ['a', 'b', 'c', 'd']]
      }
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
          expect(c[:inputs]).to eq(c[:expected_self])
          expect(actual).to eq(c[:expected_ret])
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
