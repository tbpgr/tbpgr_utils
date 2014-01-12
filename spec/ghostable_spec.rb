# encoding: utf-8
require "spec_helper"
require "ghostable"

describe Ghostable do
  context :ghost_method do
    module Checkable
      include Ghostable
      ghost_method /check_range_.*\?$/, :check_range do |method_name, *args, &block|
        method_name.to_s =~ /(check_range_)(\d+)(_to_)(\d*)/
        from = $2.to_i
        to = $4.to_i
        value = args.first
        (from..to).include? value
      end

      ghost_method /^contain_.*\?$/, :check_contain do |method_name, *args, &block|
        method_name.to_s =~ /^(contain_)(.*)(\?)/
        word = $2
        value = args.first
        value.include? word
      end
    end

    class SampleChecker
      include Checkable
    end

    cases = [
      {
        case_no: 1,
        case_title: "valid case",
        klass: SampleChecker,
        methods: [:check_range_3_to_5?, :check_range_3_to_5? ,:contain_hoge?, :contain_hoge?],
        values: [3, 6, "testhogetest", "testhigetest"],
        expecteds: [true, false, true, false],
      },
      {
        case_no: 2,
        case_title: "method_missing case",
        klass: SampleChecker,
        methods: [:not_match_method],
        values: [nil],
        expect_error: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          instance = c[:klass].new

          c[:methods].each_with_index do |method_name, index|
            if c[:expect_error]
              lambda { instance.send(method_name, c[:values][index]) }.should raise_error(StandardError)
              next
            end
            # -- when --
            actual = instance.send(method_name, c[:values][index])
            # -- then --
            expect(actual).to eq(c[:expecteds][index])
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
end
