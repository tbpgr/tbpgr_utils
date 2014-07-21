# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Array do
  context :to_table do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        inputs: [
          ['header1', 'header2', 'header3'],
          ['line1_1', 'line1_2', 'line1_3']
        ],
        expected: <<-EOS
<table>
  <tr>
    <th>header1</th>
    <th>header2</th>
    <th>header3</th>
  </tr>
  <tr>
    <td>line1_1</td>
    <td>line1_2</td>
    <td>line1_3</td>
  </tr>
</table>
        EOS
      },
      {
        case_no: 2,
        case_title: 'no header option case',
        inputs: [
          ['not_header1', 'not_header2', 'not_header3'],
          ['line1_1', 'line1_2', 'line1_3']
        ],
        options: { no_header: true },
        expected: <<-EOS
<table>
  <tr>
    <td>not_header1</td>
    <td>not_header2</td>
    <td>not_header3</td>
  </tr>
  <tr>
    <td>line1_1</td>
    <td>line1_2</td>
    <td>line1_3</td>
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

          # -- when/then --
          actual = c[:options] ? c[:inputs].to_html_table(c[:options]) : c[:inputs].to_html_table

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
