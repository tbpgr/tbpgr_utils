# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Numeric do
  context :to_binary_html_table do
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
    <th>2digit</th>
  </tr>
  <tr>
    <td>1</td>
    <td>00000001</td>
  </tr>
  <tr>
    <td>2</td>
    <td>00000010</td>
  </tr>
  <tr>
    <td>3</td>
    <td>00000011</td>
  </tr>
</table>
        EOS
      },
      {
        case_no: 2,
        case_title: '255-256 case',
        from: 255,
        to: 256,
        expected: <<-EOS
<table>
  <tr>
    <th>10digit</th>
    <th>2digit</th>
  </tr>
  <tr>
    <td>255</td>
    <td>0000000011111111</td>
  </tr>
  <tr>
    <td>256</td>
    <td>0000000100000000</td>
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
          actual = Numeric.to_binary_html_table(c[:from], c[:to])

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
