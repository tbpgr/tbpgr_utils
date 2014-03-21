# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'

describe Kernel do
  context :evalb do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: 1,
        eval_code: "n = n + 1\nn = n + 2",
        expected: 4,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message = c[:bind] if c[:bind]
          n = c[:input]

          # -- when --
          actual = evalb(binding) do
            c[:eval_code]
          end

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
