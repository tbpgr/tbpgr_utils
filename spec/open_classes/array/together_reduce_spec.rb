# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_reduce do
    cases = [
      {
        case_no: 1,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: nil,
        logic: 'memo + first + second',
        method_name: :together_reduce,
        expected: 20
      },
      {
        case_no: 2,
        case_title: 'single with init valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: 10,
        logic: 'memo + first + second',
        method_name: :together_reduce,
        expected: 30
      },
      {
        case_no: 5,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        logic: 'memo + first + second',
        expected: 20,
        method_name: :treduce
      },
      {
        case_no: 6,
        case_title: 'single valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        logic: 'memo + first + second',
        expected: 20,
        method_name: :together_inject
      },
      {
        case_no: 7,
        case_title: 'multi valid case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        logic: 'memo + first + second',
        expected: 20,
        method_name: :tinject
      },
      {
        case_no: 8,
        case_title: 'single with init valid array case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: [],
        logic: 'memo << first + second',
        method_name: :together_reduce,
        expected: [5, 4, 6, 5]
      },
      {
        case_no: 9,
        case_title: 'single with init valid array case',
        inputs: [[1, 2, 3, 4], [4, 2, 3, 1]],
        init: {},
        logic: 'memo[first] = second; memo',
        method_name: :together_reduce,
        expected: { 1 => 4, 2 => 2, 3 => 3, 4 => 1 }
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          if c[:init]
            actual = c[:inputs].method(c[:method_name]).call(c[:init]) { |memo, first, second| eval c[:logic], binding }
          else
            actual = c[:inputs].method(c[:method_name]).call { |memo, first, second| eval c[:logic], binding }
          end

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
