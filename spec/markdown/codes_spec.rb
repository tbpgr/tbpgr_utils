# encoding: utf-8
require 'spec_helper'
require 'markdown/codes'

describe MarkdownString do
  context :codes do
    cases = [
      {
        case_no: 1,
        case_title: 'string case',
        input: "class Hoge\n  def hoge\n    'hoge'\n  end\nend\n",
        lang: 'ruby',
        expected: <<-EOS
~~~ruby
class Hoge
  def hoge
    'hoge'
  end
end
~~~
        EOS
      },
      {
        case_no: 2,
        case_title: 'string no lang case',
        input: "class Hoge\n  def hoge\n    'hoge'\n  end\nend\n",
        lang: nil,
        expected: <<-EOS
~~~
class Hoge
  def hoge
    'hoge'
  end
end
~~~
        EOS
      },
      {
        case_no: 3,
        case_title: 'not string case',
        input: 1,
        lang: 'ruby',
        expected: 1,
      },
      {
        case_no: 4,
        case_title: 'empty case',
        input: '',
        lang: 'ruby',
        expected: <<-EOS
~~~ruby
~~~
        EOS
      },
      {
        case_no: 5,
        case_title: 'nil case',
        input: nil,
        lang: 'ruby',
        expected: <<-EOS
~~~ruby
~~~
        EOS
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = MarkdownString.codes c[:input], c[:lang]

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
