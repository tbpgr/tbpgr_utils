# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'

describe Kernel do
  context 'booleans' do
    cases = [
      {
        case_no: 1,
        case_title: 'yes case',
        input: yes,
        expected: true
      },
      {
        case_no: 2,
        case_title: 'ok case',
        input: ok,
        expected: true
      },
      {
        case_no: 3,
        case_title: 'good case',
        input: good,
        expected: true
      },
      {
        case_no: 4,
        case_title: 'no case',
        input: no,
        expected: false
      },
      {
        case_no: 5,
        case_title: 'ng case',
        input: ng,
        expected: false
      },
      {
        case_no: 6,
        case_title: 'bad case',
        input: bad,
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input]

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
