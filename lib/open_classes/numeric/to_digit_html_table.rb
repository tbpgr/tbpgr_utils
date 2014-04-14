# encoding: utf-8

# Numeric
class Numeric
  # return is digit html table
  #
  # ==== Examples
  #
  # 255 to 256 case
  #
  #   Numeric.to_digit_html_table(255, 256)
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <th>10digit</th>
  #       <th>2digit</th>
  #       <th>8digit</th>
  #       <th>16digit</th>
  #     </tr>
  #     <tr>
  #       <td>255</td>
  #       <td>0000000011111111</td>
  #       <td>377</td>
  #       <td>00ff</td>
  #     </tr>
  #     <tr>
  #       <td>256</td>
  #       <td>0000000100000000</td>
  #       <td>400</td>
  #       <td>0100</td>
  #     </tr>
  #   </table>
  #
  def self.to_digit_html_table(from = 1, to = 10)
    ret = []
    binary_size = to.to_s(2).size - 1
    binary_pad = (binary_size / 8 + 1) * 8
    oct_size = to.to_s(8).size
    hex_size = to.to_s(16).size - 1
    hex_pad = (hex_size / 4 + 1) * 4
    ret << "<table>\n  <tr>\n    <th>10digit</th>\n    <th>2digit</th>\n    <th>8digit</th>\n    <th>16digit</th>\n  </tr>"
    (from..to).each { |i|ret << "  <tr>\n    <td>#{i}</td>\n    <td>#{i.to_s(2).rjust(binary_pad, '0')}</td>\n    <td>#{i.to_s(8).rjust(oct_size, '0')}</td>\n    <td>#{i.to_s(16).rjust(hex_pad, '0')}</td>\n  </tr>" }
    ret.join("\n") + "\n</table>\n"
  end
end
