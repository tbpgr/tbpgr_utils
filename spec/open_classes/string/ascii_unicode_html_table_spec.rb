# encoding: utf-8
require 'spec_helper'
require 'open_classes/string/ascii_unicode_html_table'

describe String do
  context :ascii_unicode_html_table do
    cases = [
      {
        case_no: 1,
        case_title: '> case',
        input: 'aあb',
        expected: <<-EOS
<table>
  <tr>
    <th>char</th>
    <th>ASCII</th>
    <th>ascii2</th>
    <th>Unicode</th>
  </tr>
  <tr>
    <td>a</td>
    <td>97</td>
    <td>1100001</td>
    <td>--</td>
  </tr>
  <tr>
    <td>あ</td>
    <td>--</td>
    <td>--</td>
    <td>0x3042</td>
  </tr>
  <tr>
    <td>b</td>
    <td>98</td>
    <td>1100010</td>
    <td>--</td>
  </tr>
</table>
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = c[:input].ascii_unicode_html_table

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
