# encoding: utf-8
require 'spec_helper'
require 'open_classes/module'

describe Module do
  context :alias_methods do
    class Hoge
      def hoge
        'hoge'
      end

      alias_methods [:hige, :hege, :huge], :hoge
    end
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        klass: Hoge,
        target: :hoge,
        inputs: [:hige, :hege, :huge],
        expected: 'hoge',
      },
      {
        case_no: 2,
        case_title: 'not Array error case',
        klass: Hoge,
        expect_error: true,
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          hoge = c[:klass].new

          # -- when --
          if c[:expect_error]
            lambda do
              class Hige
                def hige
                  'hige'
                end
                alias_methods 'invalid type', :hige
              end
            end.should raise_error(TypeError)
            next
          end

          c[:inputs].each do |m|
            actual = hoge.send m
            # -- then --
            expect(actual).to eq(c[:expected])
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
