# encoding: utf-8

# Numeric
class Numeric
  # return is oct html table
  #
  # ==== Examples
  #
  # 65535 to 65536 case
  #
  #   Numeric.to_oct_html_table(65535, 65536)
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <th>10digit</th>
  #       <th>8digit</th>
  #     </tr>
  #     <tr>
  #       <td>65535</td>
  #       <td>177777</td>
  #     </tr>
  #     <tr>
  #       <td>65536</td>
  #       <td>200000</td>
  #     </tr>
  #   </table>
  #
  def self.to_oct_html_table(from = 1, to = 10)
    ret = []
    size = to.to_s(8).size
    ret << "<table>\n  <tr>\n    <th>10digit</th>\n    <th>8digit</th>\n  </tr>"
    (from..to).each { |i|ret << "  <tr>\n    <td>#{i}</td>\n    <td>#{i.to_s(8)}</td>\n  </tr>" }
    ret.join("\n") + "\n</table>\n"
  end
end
