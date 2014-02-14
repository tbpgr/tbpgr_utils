# encoding: utf-8
require 'spec_helper'
require 'active_support/core_ext/object/inclusion'
require 'tbpgr_utils'

describe Array do
  context :together_shuffle do
    cases = [
      {
        case_no: 1,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'together_shuffle',
        expected_first: 'actual[0].sort == c[:inputs][0]',
        expected_second: 'actual[1].sort == c[:inputs][1]',
      },
      {
        case_no: 2,
        case_title: 'not empty case',
        inputs: [[1, 2], [5, 6]],
        method_name: 'tshuffle',
        expected_first: 'actual[0].sort == c[:inputs][0]',
        expected_second: 'actual[1].sort == c[:inputs][1]',
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
          expect(actual[0].sort).to eq(c[:inputs][0])
          expect(actual[1].sort).to eq(c[:inputs][1])
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
