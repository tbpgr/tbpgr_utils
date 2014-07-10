# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Hash do
  context :table do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: {
          key_1: :value1___________________,
          key__2: :value2,
          key___3: :value3
        },
        expected: <<-EOS
|key_1  |value1___________________|
|key__2 |value2                   |
|key___3|value3                   |
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].table

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
