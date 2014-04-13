# encoding: utf-8

# Numeric
class Numeric
  # binary table
  #
  # ==== Examples
  #
  # 1 to 3 case
  #
  #   Numeric.to_binary_html_table(1, 3)
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <th>10digit</th>
  #       <th>2digit</th>
  #     </tr>
  #     <tr>
  #       <td>255</td>
  #       <td>0000000011111111</td>
  #     </tr>
  #     <tr>
  #       <td>256</td>
  #       <td>0000000100000000</td>
  #     </tr>
  #   </table>
  #
  def self.to_binary_html_table(from = 1, to = 10)
    ret = []
    size = to.to_s(2).size - 1
    pad = (size / 8 + 1) * 8
    ret << "<table>\n  <tr>\n    <th>10digit</th>\n    <th>2digit</th>\n  </tr>"

    (from..to).each { |i|ret << "  <tr>\n    <td>#{i}</td>\n    <td>#{i.to_s(2).rjust(pad, '0')}</td>\n  </tr>" }
    ret.join("\n") + "\n</table>\n"
  end
end
