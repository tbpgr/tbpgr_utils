# encoding: utf-8
require 'open_classes/numeric/is_ascii'
require 'open_classes/string/ascii1_other2_size'

# String
class String
  # get ascii_unicode_table
  #
  # === Example
  #
  # input
  #   'aあb'
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <th>char</th>
  #       <th>ASCII</th>
  #       <th>ascii2</th>
  #       <th>Unicode</th>
  #     </tr>
  #     <tr>
  #       <td>a</td>
  #       <td>97</td>
  #       <td>1100001</td>
  #       <td>--</td>
  #     </tr>
  #     <tr>
  #       <td>あ</td>
  #       <td>--</td>
  #       <td>--</td>
  #       <td>0x3042</td>
  #     </tr>
  #     <tr>
  #       <td>b</td>
  #       <td>98</td>
  #       <td>1100010</td>
  #       <td>--</td>
  #     </tr>
  #   </table>
  #
  def ascii_unicode_html_table
    ret = ["<table>\n  <tr>\n    <th>char</th>\n    <th>ASCII</th>\n    <th>ascii2</th>\n    <th>Unicode</th>\n  </tr>"]
    chars.each do |c|
      each_ret = []
      each_ret << "  <tr>\n    <td>#{c}</td>"
      if c.ord.is_ascii?
        each_ret << "    <td>#{c.ord}</td>"
        each_ret << "    <td>#{c.ord.to_s(2)}</td>"
        each_ret << "    <td>--</td>\n  </tr>"
      else
        each_ret << '    <td>--</td>'
        each_ret << '    <td>--</td>'
        each_ret << "    <td>0x#{c.ord.to_s(16)}</td>\n  </tr>"
      end
      ret << each_ret.join("\n")
    end
    (ret.join("\n") + "\n</table>\n")
  end
end
