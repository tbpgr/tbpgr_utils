# encoding: utf-8

# Numeric
class Numeric
  # return is hex table
  #
  # ==== Examples
  #
  # 65535 to 65536 case
  #
  #   Numeric.to_hex_html_table(65535, 65536)
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <th>10digit</th>
  #       <th>16digit</th>
  #     </tr>
  #     <tr>
  #       <td>65535</td>
  #       <td>0000ffff</td>
  #     </tr>
  #     <tr>
  #       <td>65536</td>
  #       <td>00010000</td>
  #     </tr>
  #   </table>
  #
  def self.to_hex_html_table(from = 1, to = 10)
    ret = []
    size = to.to_s(16).size - 1
    pad = (size / 4 + 1) * 4
    ret << "<table>\n  <tr>\n    <th>10digit</th>\n    <th>16digit</th>\n  </tr>"
    (from..to).each { |i|ret << "  <tr>\n    <td>#{i}</td>\n    <td>#{i.to_s(16).rjust(pad, '0')}</td>\n  </tr>" }
    ret.join("\n") + "\n</table>\n"
  end
end
