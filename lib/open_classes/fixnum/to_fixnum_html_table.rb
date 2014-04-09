# encoding: utf-8
require 'open_classes/array/to_table'

# Fixnum
class Fixnum
  # return value is fixnum table
  #
  # ==== Examples
  #
  # 1 to 30 by 10 case
  #
  #   Fixnum.to_fixnum_table(1, 30, 10)
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <td>1</td>
  #       <td>2</td>
  #       <td>3</td>
  #       <td>4</td>
  #       <td>5</td>
  #       <td>6</td>
  #       <td>7</td>
  #       <td>8</td>
  #       <td>9</td>
  #       <td>10</td>
  #     </tr>
  #     <tr>
  #       <td>11</td>
  #       <td>12</td>
  #       <td>13</td>
  #       <td>14</td>
  #       <td>15</td>
  #       <td>16</td>
  #       <td>17</td>
  #       <td>18</td>
  #       <td>19</td>
  #       <td>20</td>
  #     </tr>
  #     <tr>
  #       <td>21</td>
  #       <td>22</td>
  #       <td>23</td>
  #       <td>24</td>
  #       <td>25</td>
  #       <td>26</td>
  #       <td>27</td>
  #       <td>28</td>
  #       <td>29</td>
  #       <td>30</td>
  #     </tr>
  #   </table>
  #
  # 1 to 10 by 2 case
  #
  #   Fixnum.to_fixnum_table(1, 10, 2)
  #
  # result
  #
  #   <table>
  #     <tr>
  #       <td>1</td>
  #       <td>2</td>
  #     </tr>
  #     <tr>
  #       <td>3</td>
  #       <td>4</td>
  #     </tr>
  #     <tr>
  #       <td>5</td>
  #       <td>6</td>
  #     </tr>
  #     <tr>
  #       <td>7</td>
  #       <td>8</td>
  #     </tr>
  #     <tr>
  #       <td>9</td>
  #       <td>10</td>
  #     </tr>
  #   </table>
  #
  def self.to_fixnum_html_table(from = 1, to = 100, return_num = 10)
    return '' unless from.is_a?(Fixnum)
    return '' unless to.is_a?(Fixnum)
    table_contents = [*from..to].each_slice(return_num).to_a.reduce([]) do |rets, row|
      rets << '  <tr>'
      rets << row.reduce([]) do |ret, column|
        ret << "    <td>#{column}</td>"
        ret
      end.join("\n")
      rets << '  </tr>'
      rets
    end.join("\n")
    "<table>\n" + table_contents + "\n</table>\n"
  end
end
