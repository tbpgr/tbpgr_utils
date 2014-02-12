# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :together_insert do
    cases = [
      {
        case_no: 1,
        case_title: 'both insert exist case',
        inputs: [[*1..5], [*5..9]],
        exec_code: 'together_insert(1, 55, 66)',
        expected: [[1, 55, 66, 2, 3, 4, 5], [5, 55, 66, 6, 7, 8, 9]],
      },
      {
        case_no: 2,
        case_title: 'both insert exist and minus index case',
        inputs: [[*1..5], [*5..9]],
        exec_code: 'together_insert(-2, 55, 66)',
        expected: [[1, 2, 3, 4, 55, 66, 5], [5, 6, 7, 8, 55, 66, 9]],
      },
      {
        case_no: 3,
        case_title: 'both insert exist and over index case',
        inputs: [[*1..5], [*5..9]],
        exec_code: 'together_insert(6, 55, 66)',
        expected: [[1, 2, 3, 4, 5, nil, 55, 66], [5, 6, 7, 8, 9, nil, 55, 66]],
      },
      {
        case_no: 4,
        case_title: 'both insert exist case(alias tinsert)',
        inputs: [[*1..5], [*5..9]],
        exec_code: 'tinsert(1, 55, 66)',
        expected: [[1, 55, 66, 2, 3, 4, 5], [5, 55, 66, 6, 7, 8, 9]],
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = eval "#{c[:inputs]}.#{c[:exec_code]}", binding

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
