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

  context :puts_eval do
    cases = [
      {
        case_no: 1,
        case_title: 'no bind case',
        code: '8/4',
        expected: "8/4 # => 2\n",
      },
      {
        case_no: 2,
        case_title: 'with bind case',
        code: '"hoge-#{message}"',
        bind: 'msg',
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
          actual = capture_stdout { puts_eval c[:code], binding }

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

  context :bulk_define_methods do
    cases = [
      {
        case_no: 1,
        case_title: 'all Array case',
        classes: [NilClass, FalseClass],
        methods: [:blank?, :present?],
        contents: [true, false],
        instances: [nil, false],
        expecteds: [true, false, true, false],
      },
      {
        case_no: 2,
        case_title: 'Class, String, String case',
        classes: NilClass,
        methods: 'hoge',
        contents: 'ret hoge',
        instances: [nil],
        expecteds: ['ret hoge'],
      },
      {
        case_no: 3,
        case_title: 'invalid classes type case',
        classes: :NilClass,
        methods: 'hoge',
        contents: 'ret hoge',
        expect_error: true,
      },
      {
        case_no: 4,
        case_title: 'invalid methods type case',
        classes: NilClass,
        methods: 1,
        contents: 'ret hoge',
        expect_error: true,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if c[:expect_error]
            lambda { bulk_define_methods c[:classes], c[:methods], c[:contents] }.should raise_error(StandardError)
            next
          end
          bulk_define_methods c[:classes], c[:methods], c[:contents]

          # -- then --
          method_list = c[:methods].is_a?(Array) ? c[:methods] : [c[:methods]]
          cnt = 0
          c[:instances].each do |instance|
            method_list.each do |method_name|
              expect(instance.method(method_name).call).to eq(c[:expecteds][cnt])
              cnt += 1
            end
          end
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

  context :bluk_puts_eval do
    BULK_CODE1 =<<-EOS
"hoge-hige1" + "add"
"hoge-hige2" + "add"
    EOS

    BULK_EXPECTED1 =<<-EOS
"hoge-hige1" + "add" # => "hoge-hige1add"
"hoge-hige2" + "add" # => "hoge-hige2add"
    EOS

    BULK_CODE2 =<<-EOS
"hoge-hige1" + "add" + message
"hoge-hige2" + "add" + message
    EOS

    BULK_EXPECTED2 =<<-EOS
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
      },
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
