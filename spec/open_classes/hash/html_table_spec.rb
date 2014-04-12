# encoding: utf-8
require 'spec_helper'
require 'tbpgr_utils'

describe Hash do
  context :html_table do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        input: {
          key_1: :value1,
          key__2: :value2,
          key___3: :value3,
        },
        expected: <<-EOS
<table>
  <tr>
    <td>key_1</td>
    <td>value1</td>
  </tr>
  <tr>
    <td>key__2</td>
    <td>value2</td>
  </tr>
  <tr>
    <td>key___3</td>
    <td>value3</td>
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
          actual = c[:input].html_table

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
