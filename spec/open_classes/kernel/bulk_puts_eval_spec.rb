# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'
require 'test_toolbox'

describe Kernel do
  context :bluk_puts_eval do
    BULK_CODE1 = <<-EOS
"hoge-hige1" + "add"
"hoge-hige2" + "add"
    EOS

    BULK_EXPECTED1 = <<-EOS
"hoge-hige1" + "add" # => "hoge-hige1add"
"hoge-hige2" + "add" # => "hoge-hige2add"
    EOS

    BULK_CODE2 = <<-EOS
"hoge-hige1" + "add" + message
"hoge-hige2" + "add" + message
    EOS

    BULK_EXPECTED2 = <<-EOS
"hoge-hige1" + "add" + message # => "hoge-hige1addmsg"
"hoge-hige2" + "add" + message # => "hoge-hige2addmsg"
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'no bind case',
        code: BULK_CODE1,
        expected: BULK_EXPECTED1
      },
      {
        case_no: 2,
        case_title: 'with bind case',
        code: BULK_CODE1,
        bind: 'msg',
        expected: BULK_EXPECTED1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message = c[:bind] if c[:bind]

          # -- when --
          actual = capture_stdout { bulk_puts_eval binding, c[:code] }

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
