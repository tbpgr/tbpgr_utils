# TbpgrUtils

TbpgrUtils is Utilities.

## Installation

Add this line to your application's Gemfile:

    gem 'tbpgr_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tbpgr_utils

## Usage
### List
| dsl| mean|
|:-----------|:------------|
|Object#boolean?|data type check for boolean|
|Object#my_methods|return public/protected/private self define methods|
|String#justify_table|justify pipe format table string|

### Object#boolean?
~~~ruby
require 'tbpgr_utils'

p true.boolean?    # =>true
p false.boolean?   # =>true
p nil.boolean?     # =>false
p "".boolean?      # =>false
p "true".boolean?  # =>false
~~~

### Object#my_methods
~~~ruby
require 'tbpgr_utils'

class Hoge
  def hgoe
  end

  protected
  def hige
  end

  private
  def hege
  end
end

p Hoge.new.my_methods # =>[:hoge, :hige, :hege]
~~~

### String#justify_table
~~~ruby
require 'tbpgr_utils'

str =<<-EOS
|* hogehogehoge|* hege|* hige|
|test|tester|testest|
|test|tester|aaaaaaaaaaaaaaaaaaaaaaatestest|
EOS

puts str.justify_table
~~~

output
~~~
|* hogehogehoge|* hage|* hige                        |
|test          |tester|testest                       |
|test          |tester|aaaaaaaaaaaaaaaaaaaaaaatestest|
~~~

## History
* version 0.0.1 : first release.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
