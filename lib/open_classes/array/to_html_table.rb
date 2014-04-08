# encoding: utf-8
require 'open_classes/string/justify_table'

# Array
class Array
  # Array(Array, Array...) to html table format.
  #
  # === Example
  #
  #   [['header1', 'header2', 'header3'],['line1_1', 'line1_2', 'line1_3']].to_html_table
  #
  # result
  #   <table>
  #     <tr>
  #       <th>header1</th>
  #       <th>header2</th>
  #       <th>header3</th>
  #     </tr>
  #     <tr>
  #       <td>line1_1</td>
  #       <td>line1_2</td>
  #       <td>line1_3</td>
  #     </tr>
  #   </table>
  #
  def to_html_table(options = { no_header: false })
    options[:no_header] = false if options[:no_header].nil?
    cnt = options[:no_header] ? 1 : 0
    ret = reduce(['<table>']) do |rets, lines|
      ret = lines.reduce([]) do |ret, column|
        tag = (cnt == 0) ? 'th' : 'td'
        ret << "    <#{tag}>#{column}</#{tag}>"
        ret
      end
      cnt += 1
      inner_tr = ret.join("\n")
      rets << "  <tr>\n#{inner_tr}\n  </tr>"
    end.join("\n") + "\n</table>\n"
  end
end
