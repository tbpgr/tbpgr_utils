# encoding: utf-8
require 'spec_helper'
require 'open_classes/integer/palindromic_prime'

describe Integer do
  context :palindromic_prime? do
    cases = [
      {
        case_no: 1,
        case_title: '0 case',
        input: 0,
        expected: false
      },
      {
        case_no: 2,
        case_title: '1 case',
        input: 1,
        expected: false
      },
      {
        case_no: 3,
        case_title: 'palindromic_primes case(2)',
        input: 2,
        expected: true
      },
      {
        case_no: 4,
        case_title: 'palindromic_primes case(757)',
        input: 757,
        expected: true
      },
      {
        case_no: 5,
        case_title: 'not palindromic_primes case(758)',
        input: 758,
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
          actual = c[:input].palindromic_prime?

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
