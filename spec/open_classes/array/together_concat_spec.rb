# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_concat do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        add_list: [4, 5, 6],
        method_name: :together_concat,
        expected: [[1, 2, 3, 4, 5, 6], ['one', 'two', 'three', 4, 5, 6]],
      },
      {
        case_no: 2,
        case_title: 'valid case',
        inputs: [[1, 2, 3], %w{one two three}],
        add_list: [4, 5, 6],
        method_name: :tconcat,
        expected: [[1, 2, 3, 4, 5, 6], ['one', 'two', 'three', 4, 5, 6]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          c[:inputs].send c[:method_name], c[:add_list]

          # -- then --
          expect(c[:inputs]).to eq(c[:expected])
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
