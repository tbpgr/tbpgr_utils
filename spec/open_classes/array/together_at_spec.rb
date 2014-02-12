# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_at do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        index: 2,
        method_name: :together_at,
        expected: [3, 'three'],
      },
      {
        case_no: 2,
        case_title: 'contain nil case',
        inputs: [[1, 2, 3], %w{one two}],
        index: 2,
        method_name: :together_at,
        expected: [3, nil],
      },
      {
        case_no: 3,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        index: 2,
        method_name: :tat,
        expected: [3, 'three'],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name], c[:index]

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
