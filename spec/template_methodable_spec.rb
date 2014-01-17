# encoding: utf-8
require 'spec_helper'
require 'template_methodable'

describe TemplateMethodable do

  context :must_impl do
    class BaseDeveloper
      include TemplateMethodable
      must_impl :easy_coding, :difficult_coding, :normal_coding

      module DIFFICILTY
        EASY = 1
        NORMAL = 2
        DIFFICILT = 3
      end

      def coding(difficulty)
        ret = []
        ret << 'start coding'
        case difficulty
        when DIFFICILTY::EASY
          ret << easy_coding('hoge', 'hige')
        when DIFFICILTY::NORMAL
          ret << normal_coding('hoge', 'hige')
        when DIFFICILTY::DIFFICILT
          ret << difficult_coding('hoge', 'hige')
        else
          fail 'error'
        end
        ret << 'finish coding'
        ret.join("\n")
      end
    end

    class StarDeveloper < BaseDeveloper
      def easy_coding(hoge, hige)
        'complete 1 minutes'
      end
      def normal_coding(hoge, hige)
        'complete 10 minutes'
      end
      def difficult_coding(hoge, hige)
        'complete 59 minutes'
      end
    end

    class NotImplDeveloper < BaseDeveloper
    end

    cases = [
      {
        case_no: 1,
        case_title: 'all imple easy case',
        klass: StarDeveloper,
        method_name: :coding,
        difficulty: BaseDeveloper::DIFFICILTY::EASY,
        expected: <<-EOS
start coding
complete 1 minutes
finish coding
        EOS
      },
      {
        case_no: 2,
        case_title: 'not imple all case',
        klass: NotImplDeveloper,
        method_name: :coding,
        difficulty: BaseDeveloper::DIFFICILTY::NORMAL,
        expect_error: true,
        error_class: NotImplementedError
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          exec = lambda { c[:klass].new.method(c[:method_name]).call c[:difficulty] }
          if c[:expect_error]
            exec.should raise_error(NotImplementedError)
            next
          end
          actual = exec.call

          # -- then --
          expect(actual).to eq(c[:expected].chop)
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
