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
|Array#together|loop all arrays by block|
|Object#any_of?|if self match any one of items, return true|
|Object#boolean?|data type check for boolean|
|Object#my_methods|return public/protected/private self define methods|
|String#justify_table|justify pipe format table string|
|AttributesInitializable::ClassMethods.attr_accessor_init|generate attr_accessors + initializer|

### Array#together
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
[alpha, numbers].together do |first, second|
  print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
end
~~~

### Object#any_of?
~~~ruby
require 'tbpgr_utils'

p 'hoge'.any_of? 'hoge', 'hige'    # =>true
p 'hoge'.any_of?(*%w{hoge hige})    # =>true
p 'hige'.any_of? 'hoge', 'hige'    # =>true
p 'hege'.any_of? 'hoge', 'hige'    # =>false
p 1.any_of? 1, 2, 3                # =>true
p 4.any_of? 1, 2, 3                # =>false
~~~

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

### AttributesInitializable::ClassMethods.attr_accessor_init
~~~ruby
require 'attributes_initializable'

class AccessorSample
  include AttributesInitializable
  attr_accessor_init :atr1, :atr2
end

atr_sample1 = AccessorSample.new :atr1 => 'atr1', :atr2 => 'atr2'
p atr_sample1.atr1 # => atr1
p atr_sample1.atr2 # => atr2

atr_sample2 = AccessorSample.new do |a|
  a.atr1 = 'atr1'
  a.atr2 = 'atr2'
end
p atr_sample2.atr1 # => atr1
p atr_sample2.atr2 # => atr2
~~~

same mean code is
~~~ruby
class AccessorSample
  attr_accessor :atr1, :atr2

  def initialize(values = nil, &block)
    return yield self if block
    @atr1 = values[:atr1]
    @atr2 = values[:atr2]
  end
end

atr_sample1 = AccessorSample.new :atr1 => 'atr1', :atr2 => 'atr2'
p atr_sample1.atr1 # => atr1
p atr_sample1.atr2 # => atr2

atr_sample2 = AccessorSample.new do |a|
  a.atr1 = 'atr1'
  a.atr2 = 'atr2'
end
p atr_sample2.atr1 # => atr1
p atr_sample2.atr2 # => atr2
~~~

## History
* version 0.0.4 : AttributesInitializable::ClassMethods.attr_accessor_init
* version 0.0.3 : add Object#any_of?
* version 0.0.2 : loop all arrays by block.
* version 0.0.1 : first release.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
