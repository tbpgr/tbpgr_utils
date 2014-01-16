# encoding: utf-8
require "spec_helper"
require "test_toolbox/kernel"

describe Kernel do
  context :capture_stdout do
    cases = [
      {
        case_no: 1,
        case_title: "have STDOUT case",
        code: "print 'hoge'",
        expected: "hoge",
      },
      {
        case_no: 2,
        case_title: "don't have STDOUT case",
        code: "",
        expected: "",
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = capture_stdout {eval c[:code]}

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

  context :dp_line do
    cases = [
      {
        case_no: 1,
        case_title: "default case",
        have_filename: true,
        have_char: false,
        expected: "--------------------|filename=$filename$|line=$line$|--------------------\n",
      },
      {
        case_no: 2,
        case_title: "specific har case",
        have_filename: false,
        have_char: true,
        char: '@',
        expected: "@@@@@@@@@@@@@@@@@@@@|filename=$filename$|line=$line$|@@@@@@@@@@@@@@@@@@@@\n",
      },
      {
        case_no: 3,
        case_title: "no options case",
        have_filename: false,
        have_char: false,
        expected: "--------------------|filename=$filename$|line=$line$|--------------------\n",
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          options = {}
          options[:filename] = __FILE__ if c[:have_filename]
          options[:char] = c[:char] if c[:have_char]

          # -- when --
          line = nil
          if !c[:have_filename] && !c[:have_char]
            actual = capture_stdout{ line = __LINE__ if c[:have_line];dp_line line }
          else
            actual = capture_stdout{ line = __LINE__ if c[:have_line];dp_line line, options }
          end

          # -- then --
          expected = c[:expected]
          file_gsub = c[:have_filename] ? __FILE__.to_s : ""
          expected = expected.gsub("$filename$", file_gsub)
          expected = expected.gsub("$line$", line.to_s)
          expect(actual).to eq(expected)
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
