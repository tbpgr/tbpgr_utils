# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_delete_if do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3, 4], [6, 4, 6, 8]],
        delete_block_code: '(first + second).odd?',
        method_name: :together_delete_if,
        expected: [[2, 4], [4, 8]]
      },
      {
        case_no: 2,
        case_title: 'not have delete target value case',
        inputs: [[2, 2, 4, 4], [6, 4, 6, 8]],
        delete_block_code: '(first + second).odd?',
        method_name: :together_delete_if,
        expected: nil
      },
      {
        case_no: 3,
        case_title: 'valid case(alias tdelete_if)',
        inputs: [[1, 2, 3, 4], [6, 4, 6, 8]],
        delete_block_code: '(first + second).odd?',
        method_name: :tdelete_if,
        expected: [[2, 4], [4, 8]]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:inputs].send c[:method_name] { |first, second|eval c[:delete_block_code], binding }

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
