# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'

describe Kernel do
  context :exchange do

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input_a: 'aaa',
        input_b: 'bbb',
        expected_a: 'bbb',
        expected_b: 'aaa',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual_a, actual_b = exchange c[:input_a], c[:input_b]

          # -- then --
          expect(actual_a).to eq(c[:expected_a])
          expect(actual_b).to eq(c[:expected_b])
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
