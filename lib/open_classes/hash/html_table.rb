# encoding: utf-8

# Hash
class Hash
  # get html table string from key + value
  #
  # ==== Examples
  #
  # valid commma case
  #
  #   {
  #     :key_1 => :value1,
  #     :key__2 => :value2,
  #     :key___3 => :value3,
  #   }.html_table
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <td>key_1</td>
  #       <td>value1</td>
  #     </tr>
  #     <tr>
  #       <td>key__2</td>
  #       <td>value2</td>
  #     </tr>
  #     <tr>
  #       <td>key___3</td>
  #       <td>value3</td>
  #     </tr>
  #   </table>
  #
  def html_table
    ret = [keys, values].treduce(['<table>']) do |ret, one, other|
      ret << "  <tr>\n    <td>#{one}</td>\n    <td>#{other}</td>\n  </tr>"
      ret
    end
    ret.join("\n") + "\n</table>\n"
  end
end
