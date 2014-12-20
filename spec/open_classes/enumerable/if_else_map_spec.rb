# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Enumerable do
  context :if_else_map do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: 1..4,
        predicate: :odd?.to_proc,
        proc_t: ->(odd){'奇数'},
        proc_f: ->(even){'偶数'},
        expected: ['奇数','偶数','奇数','偶数']
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when/then --
          actual = c[:input].if_else_map(c[:predicate],c[:proc_t],c[:proc_f])

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
