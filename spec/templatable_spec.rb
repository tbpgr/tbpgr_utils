# encoding: utf-8
require 'spec_helper'
require 'templatable'

describe Templatable do
  context :result do
    class TemplateUser
      include Templatable
      template <<-EOS
line1:<%=placeholders[:hoge]%>
line2:<%=placeholders[:hige]%>
      EOS

      def manufactured_hoge
        "hoge-#{@materials}"
      end

      def manufactured_hige
        "hige-#{@materials}"
      end
    end

    RESULT_CASE1 = <<-EOS
line1:hoge-sample
line2:hige-sample
    EOS

    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        klass: TemplateUser,
        input: 'sample',
        expected: RESULT_CASE1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:klass].new(c[:input]).result

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
