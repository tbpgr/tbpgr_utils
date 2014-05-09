# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe String do

  context :justify_table do
    SAMPLE_STRING1 = <<-EOS
print 'hoge' # => 'hoge'
print 'hoge' * 2 # => 'hogehoge'
print 'hoge' + 'hige' # => 'hogehige'
    EOS

    SAMPLE_JUSTIFIED_STRING1 = <<-EOS
print 'hoge'          # => 'hoge'
print 'hoge' * 2      # => 'hogehoge'
print 'hoge' + 'hige' # => 'hogehige'
    EOS

    SAMPLE_STRING2 = <<-EOS
print 'hoge' | => 'hoge'
print 'hoge' * 2 | => 'hogehoge'
print 'hoge' + 'hige' | => 'hogehige'
    EOS

    SAMPLE_JUSTIFIED_STRING2 = <<-EOS
print 'hoge'          | => 'hoge'
print 'hoge' * 2      | => 'hogehoge'
print 'hoge' + 'hige' | => 'hogehige'
    EOS

    SAMPLE_STRING3 = <<-EOS
print 'hoge' // => 'hoge'
print 'hoge' * 2 // => 'hogehoge'
print 'hoge' + 'hige' // => 'hogehige'
    EOS

    SAMPLE_JUSTIFIED_STRING3 = <<-EOS
print 'hoge'          // => 'hoge'
print 'hoge' * 2      // => 'hogehoge'
print 'hoge' + 'hige' // => 'hogehige'
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'sharp justify case',
        input: SAMPLE_STRING1,
        separator: '#',
        expected: SAMPLE_JUSTIFIED_STRING1,
      },
      {
        case_no: 2,
        case_title: 'use default separator(pipe) justify case',
        input: SAMPLE_STRING2,
        expected: SAMPLE_JUSTIFIED_STRING2,
      },
      {
        case_no: 3,
        case_title: 'double stash justify case',
        input: SAMPLE_STRING3,
        separator: '//',
        expected: SAMPLE_JUSTIFIED_STRING3,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          if (c[:separator])
            actual = c[:input].justify_char c[:separator]
          else
            actual = c[:input].justify_char
          end

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
