# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/cygwinpath_to_winpath'

describe String do
  context :cygwinpath_to_winpath do
    cases = [
      {
        case_no: 1,
        case_title: 'file case',
        input: '/cygdrive/c/hoge/hoge.txt',
        expected: 'C:\hoge\hoge.txt',
      },
      {
        case_no: 2,
        case_title: 'dir case',
        input: '/cygdrive/d/hoge',
        expected: 'D:\hoge',
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].cygwinpath_to_winpath

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
