# encoding: utf-8
require 'spec_helper'
require 'open_classes/kernel'
require 'test_toolbox'

describe Kernel do
  context :print_eval do
    cases = [
      {
        case_no: 1,
        case_title: 'no bind case',
        code: '8/4',
        expected: '8/4 # => 2',
      },
      {
        case_no: 2,
        case_title: 'with bind case',
        code: "\"hoge-\#{message}\"",
        bind: 'msg',
        expected: "\"hoge-\#{message}\" # => \"hoge-msg\"",
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message = c[:bind] if c[:bind]

          # -- when --
          actual = capture_stdout { print_eval c[:code], binding }

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
