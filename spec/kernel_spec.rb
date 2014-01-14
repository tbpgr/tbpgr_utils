# encoding: utf-8
require "spec_helper"
require "open_classes/kernel"

describe Kernel do
  def get_stdout
    begin
      eval "$stdout = StringIO.new"
      yield
      result = eval("$stdout").string
    ensure
      eval "$stdout = STDOUT"
    end
    result
  end

  context :print_eval do
    cases = [
      {
        case_no: 1,
        case_title: "no bind case",
        code: "8/4",
        expected: "8/4 # => 2",
      },
      {
        case_no: 2,
        case_title: "with bind case",
        code: "\"hoge-\#{message}\"",
        bind: "msg",
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
          actual = get_stdout { print_eval c[:code], binding }

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

  context :puts_eval do
    cases = [
      {
        case_no: 1,
        case_title: "no bind case",
        code: "8/4",
        expected: "8/4 # => 2\n",
      },
      {
        case_no: 2,
        case_title: "with bind case",
        code: '"hoge-#{message}"',
        bind: "msg",
        expected: '"hoge-#{message}" # => "hoge-msg"' + "\n",
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message = c[:bind] if c[:bind]

          # -- when --
          actual = get_stdout { puts_eval c[:code], binding }

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
