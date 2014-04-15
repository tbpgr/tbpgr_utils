# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Numeric do
  context :to_hex_html_table do
    cases = [
      {
        case_no: 1,
        case_title: '1-3 case',
        from: 1,
        to: 3,
        expected: <<-EOS
<table>
  <tr>
    <th>10digit</th>
    <th>16digit</th>
  </tr>
  <tr>
    <td>1</td>
    <td>0001</td>
  </tr>
  <tr>
    <td>2</td>
    <td>0002</td>
  </tr>
  <tr>
    <td>3</td>
    <td>0003</td>
  </tr>
</table>
        EOS
      },
      {
        case_no: 2,
        case_title: '65535-65536 case',
        from: 65_535,
        to: 65_536,
        expected: <<-EOS
<table>
  <tr>
    <th>10digit</th>
    <th>16digit</th>
  </tr>
  <tr>
    <td>65535</td>
    <td>0000ffff</td>
  </tr>
  <tr>
    <td>65536</td>
    <td>00010000</td>
  </tr>
</table>
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
          actual = Numeric.to_hex_html_table(c[:from], c[:to])

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
