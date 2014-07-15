# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_delete_at do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 2,
        method_name: :together_delete_at,
        expected: [[1, 2, 4], [2, 3, 5]],
        ret: [3, 4]
      },
      {
        case_no: 2,
        case_title: 'valid case(not exist)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 5,
        method_name: :together_delete_at,
        expected: [[1, 2, 3, 4], [2, 3, 4, 5]],
        ret: [nil, nil]
      },
      {
        case_no: 3,
        case_title: 'valid case(minus index)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: -3,
        method_name: :together_delete_at,
        expected: [[1, 3, 4], [2, 4, 5]],
        ret: [2, 3]
      },
      {
        case_no: 4,
        case_title: 'valid case(use tdelete_at alias)',
        inputs: [[1, 2, 3, 4], [2, 3, 4, 5]],
        delete_value: 2,
        method_name: :tdelete_at,
        expected: [[1, 2, 4], [2, 3, 5]],
        ret: [3, 4]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:has_block]
            actual = c[:inputs].send c[:method_name], c[:delete_value] { c[:block] }
          else
            actual = c[:inputs].send c[:method_name], c[:delete_value]
          end

          # -- then --
          expect(actual).to eq(c[:ret])
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
