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
| class/module/method                                    | mean                                                                                                       |
|:-----------                                            |:------------                                                                                               |
|TbpgrUtils Array#together                               |loop all arrays by block                                                                                    |
|TbpgrUtils Array#together_map                           |together version of Enumerable#map. together_map has aliases [:tmap, :together_collect, :tcollect]          |
|TbpgrUtils Array#together_select                        |together version of Enumerable#select. together_select has aliases [:tselect, :together_find_all, :tfindall]|
|TbpgrUtils Array#together_with_index                    |loop all arrays by block with index                                                                         |
|AttributesInitializable::ClassMethods.attr_accessor_init|generate attr_accessor + initializer                                                                        |
|AttributesInitializable::ClassMethods.attr_reader_init  |generate attr_reader + initializer                                                                          |
|AttributesInitializable::ClassMethods.attr_writer init  |generate attr_writer + initializer                                                                          |
|Ghostable module                                        |help to create ghost method(dynamic method define by ussing method_missing + pattern-method-name)           |
|TbpgrUtils Kernel#bulk_define_methods                   |define methods to classes. methods have simple return value.                                                |
|TestToolbox Kernel#capture_stdout                       |capture STDOUT                                                                                              |
|TestToolbox Kernel#dp_line                              |debug print line for print-debugging                                                                        |
|TbpgrUtils Kernel#print_eval                            |Print code + eval result                                                                                    |
|TbpgrUtils Kernel#puts_eval                             |Puts code + eval result                                                                                     |
|TbpgrUtils Kernel#bulk_puts_eval                        |Puts each-line-code + eval result                                                                           |
|TbpgrUtils Module.alias_methods                         |create alias methods                                                                                        |
|TbpgrUtils Object#any_of?                               |if self match any one of items, return true                                                                 |
|TbpgrUtils Object#boolean?                              |data type check for boolean                                                                                 |
|TbpgrUtils Object#my_methods                            |return public/protected/private self define methods                                                         |
|TbpgrUtils Object#to_bool                               |syntax sugar of !!. convert [false, nil] => fasel, other => true.                                           |
|TbpgrUtils String#justify_table                         |justify pipe format table string                                                                            |
|Templatable module                                      |get result from template + placeholder                                                                      |
|TemplateMethodable module                               |for Template Method Pattern                                                                                 |

### Array#together
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
[alpha, numbers].together do |first, second|
  print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
end
~~~

### Array#together_map(or tmap, together_collect, tcollect)
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
ret = [alpha, numbers].together_map {|first, second|"#{first}:#{second}"}
print ret # => output [one:1, two:2, three:3]
~~~

if you want to return multi array, following.
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
ret = [alpha, numbers].together_map {|first, second|[["#{first}:ret"], ["#{second}:ret"]]}
print ret # => output [["one:ret", "two:ret", "three:ret"],["1:ret", "2:ret", "3:ret"]]
~~~

### Array#together_select(or tselect, together_find_all, tfindall)
~~~ruby
require 'tbpgr_utils'

firsts = [1, 2, 3, 4]
seconds =  [4, 2, 3, 1]
ret = [firsts, seconds].together_select{|first, second|first == second}
print ret # => output  [[2, 3], [2, 3]]
~~~

if you want to return multi array, following.
~~~ruby
require 'tbpgr_utils'

firsts = [1, 2, 3, 4]
seconds =  [4, 2, 3, 1]
ret = [firsts, seconds].together_select{|first, second|[first.odd?, second.even?]}
print ret # => output  [[1, 3], [4, 2]]
~~~

### Array#together_with_index
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
[alpha, numbers].together_with_index do |first, second, index|
  print "#{index.to_s}:#{first}:#{second}\n"  # => output 0:one:1, 1:two:2, 2:three:3
end
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

### AttributesInitializable::ClassMethods.attr_reader_init
~~~ruby
require 'attributes_initializable'

class AccessorSample
  include AttributesInitializable
  attr_reader_init :atr1, :atr2
end

atr_sample1 = AccessorSample.new :atr1 => 'atr1', :atr2 => 'atr2'
p atr_sample1.atr1 # => atr1
p atr_sample1.atr2 # => atr2

# can not use writer.
# atr_sample2 = AccessorSample.new do |a|
#   a.atr1 = 'atr1'
#   a.atr2 = 'atr2'
# end
~~~

same mean code is
~~~ruby
class AccessorSample
  attr_reader :atr1, :atr2

  def initialize(values = nil, &block)
    return yield self if block
    @atr1 = values[:atr1]
    @atr2 = values[:atr2]
  end
end

atr_sample1 = AccessorSample.new :atr1 => 'atr1', :atr2 => 'atr2'
p atr_sample1.atr1 # => atr1
p atr_sample1.atr2 # => atr2

# can not use writer.
# atr_sample2 = AccessorSample.new do |a|
#   a.atr1 = 'atr1'
#   a.atr2 = 'atr2'
# end
~~~

### AttributesInitializable::ClassMethods.attr_writer_init
~~~ruby
require 'attributes_initializable'

class AccessorSample
  include AttributesInitializable
  attr_writer_init :atr1, :atr2
end

atr_sample1 = AccessorSample.new :atr1 => 'atr1', :atr2 => 'atr2'
# can not use reader
# p atr_sample1.atr1 # => atr1
# p atr_sample1.atr2 # => atr2
atr_sample1.instance_variable_get "@atr1" # => atr1
atr_sample1.instance_variable_get "@atr2" # => atr2

atr_sample2 = AccessorSample.new do |a|
  a.atr1 = 'atr1'
  a.atr2 = 'atr2'
end

# can not use reader
# p atr_sample2.atr1 # => atr1
# p atr_sample2.atr2 # => atr2
atr_sample2.instance_variable_get "@atr1" # => atr1
atr_sample2.instance_variable_get "@atr2" # => atr2
~~~

same mean code is
~~~ruby
class AccessorSample
  attr_writer :atr1, :atr2

  def initialize(values = nil, &block)
    return yield self if block
    @atr1 = values[:atr1]
    @atr2 = values[:atr2]
  end
end

atr_sample1 = AccessorSample.new :atr1 => 'atr1', :atr2 => 'atr2'
# can not use reader
# p atr_sample1.atr1 # => atr1
# p atr_sample1.atr2 # => atr2
atr_sample1.instance_variable_get "@atr1" # => atr1
atr_sample1.instance_variable_get "@atr2" # => atr2

atr_sample2 = AccessorSample.new do |a|
  a.atr1 = 'atr1'
  a.atr2 = 'atr2'
end
# can not use reader
# p atr_sample2.atr1 # => atr1
# p atr_sample2.atr2 # => atr2
atr_sample2.instance_variable_get "@atr1" # => atr1
atr_sample2.instance_variable_get "@atr2" # => atr2
~~~

### Ghostable
* include Ghostable
* create ghost method by using Ghostable::ghost_method
* ghost_method first_args = method_name_pattern
* ghost_method second_args = method_base_name Symbol(using in Ghostable internal logic)
* ghost_method third = block. this block is main logic. block can use args[method_name, *args, &block]

sample ghost method define module.
~~~ruby
require 'ghostable'
module Checkable
  include Ghostable
  ghost_method /check_range_.*\?$/, :check_range do |method_name, *args, &block|
    method_name.to_s =~ /(check_range_)(\d+)(_to_)(\d*)/
    from = $2.to_i
    to = $4.to_i
    value = args.first
    (from..to).include? value
  end

  ghost_method /^contain_.*\?$/, :check_contain do |method_name, *args, &block|
    method_name.to_s =~ /^(contain_)(.*)(\?)/
    word = $2
    value = args.first
    value.include? word
  end
end
~~~

* use ghost method

sample ghost method use class
~~~ruby
class SampleChecker
  include Checkable
end

sample = SampleChecker.new
sample.check_range_3_to_5?(4) # => return true
sample.check_range_3_to_5?(6) # => return false
sample.check_range_3_to_6?(6) # => return true

sample.contain_hoge? "test_hoge_test" # => return true
sample.contain_hoge? "test_hige_test" # => return false
sample.contain_hige? "test_hige_test" # => return true
~~~

### Kernel#capture_stdout
capture STDOUT to String. This method can use in STDOUT contents test.

~~~ruby
require 'test_toolbox'

result = capture_stdout {puts "test"} # => "test"

# no stdout case. return empty.
result = capture_stdout {sleep 0.1} # => ""(empty)
~~~

### Kernel#dp_line
debug print line for print-debugging.

~~~ruby
require 'test_toolbox'

# default usage
dp_line __LINE__
# output is following. yy = line no.
# => --------------------|filename=|line=yy|--------------------\n

# output with filename
dp_line __LINE__, filename: __FILE__
# output is following. xx=filenamem, yy = line no.
# => --------------------|filename=xx|line=yy|--------------------\n

# output with specific line charactor.
dp_line __LINE__, filename: __FILE__, char: '@'
# output is following. xx=filenamem, yy = line no.
# => @@@@@@@@@@@@@@@@@@@@|filename=xx|line=yy$|@@@@@@@@@@@@@@@@@@@@\n
~~~

### Kernel#bulk_define_methods
Define methods to classes. Methods have simple return value.

~~~ruby
require 'tbpgr_utils'
bulk_define_methods [NilClass, FalseClass], :blank?, true
bulk_define_methods [TrueClass, Numeric], "blank?", false

puts nil.blank?   # => true
puts false.blank? # => true
puts true.blank?  # => false
puts 1.blank?     # => false

bulk_define_methods [NilClass, FalseClass], [:blank?, :present?], [true, false]
bulk_define_methods [TrueClass, Numeric], [:blank?, :present?], [false, true]

puts nil.blank?     # => true
puts nil.present?   # => false
puts false.blank?   # => true
puts false.present? # => false
puts true.blank?    # => false
puts true.present?  # => true
puts 1.blank?       # => false
puts 1.present?     # => true
~~~

if you don't use bulk_define_methods, followinng code is same mean.
~~~ruby
class NilClass
 def blank?
   true
 end

 def present?
   false
 end
end

class FalseClass
 def blank?
   true
 end

 def present?
   false
 end
end
~~~

### Kernel#print_eval
This method for sample code. for manual, for blog-entry's-snippet  ...etc.

~~~ruby
print_eval 8/4, binding  # => 8/4 # => 2

message = 'msg'
print_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"
~~~

output
~~~
8/4 # => 2"hoge-#{message}" # => "hoge-msg"
~~~

### Kernel#puts_eval
This method for sample code. for manual, for blog-entry's-snippet  ...etc.

~~~ruby
puts_eval 8/4, binding

message = 'msg'
puts_eval "hoge-#{message}", binding # => "hoge-#{message}" # => "hoge-msg"
~~~

output
~~~
8/4 # => 2
"hoge-#{message}" # => "hoge-msg"
~~~

### Kernel#bulk_puts_eval
multi line version of puts_eval.

~~~ruby
message = "msg"
bulk_puts_eval binding, <<-EOS
"hoge-hige1" + "add" + message
"hoge-hige2" + "add" + message
EOS
~~~

output
~~~
"hoge-hige1" + "add" + message # => "hoge-hige1addmsg"
"hoge-hige2" + "add" + message # => "hoge-hige2addmsg"
~~~

### Module.alias_methods
create alias methods.

~~~ruby
require "tbpgr_utils"

class Hoge
  def hoge
    "hoge"
  end

  alias_methods [:hige, :hege, :huge], :hoge
end

Hoge.new.hoge # => "hoge"
Hoge.new.hige # => "hoge"
Hoge.new.hege # => "hoge"
Hoge.new.huge # => "hoge"
~~~

same code is...
~~~
class Hoge
  def hoge
    "hoge"
  end

  alias_method :hige, :hoge
  alias_method :hege, :hoge
  alias_method :huge, :hoge
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

### Object#to_bool
~~~ruby
require 'tbpgr_utils'

p true.to_bool # => true
p false.to_bool # => false
p 'true'.to_bool # => true
p 'false'.to_bool # => true
p nil.to_bool # => false
p 0.to_bool # => true
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

### Templatable
* include Templatable
* set template by here-document
* in template, parameter must name 'placeholders[:xxxxx]'. xxxxx is your favorite name.
* when create instance, you must set materials to create template. after, you can get this value from @materials.
* you must create manufactured_xxx methods. xxx is each-placeholder name.
* you can get result by 'result' method.

~~~ruby
require 'templatable'

class TemplateUser
  include Templatable
  template <<-EOS
line1:<%=placeholders[:hoge]%>
line2:<%=placeholders[:hige]%>
  EOS

  def manufactured_hoge
    "hoge-#{@materials}"
  end

  def manufactured_hige
    "hige-#{@materials}"
  end
end

p TemplateUser.new('sample').result
~~~

output
~~~
line1:hoge-sample
line2:hige-sample
~~~

## TemplateMethodable
sample usage

~~~ruby
require "template_methodable"
# sample BaseClass
class BaseDeveloper
  include TemplateMethodable
  must_impl :easy_coding, :difficult_coding, :normal_coding
  module DIFFICILTY
    EASY = 1
    NORMAL = 2
    DIFFICILT = 3
  end
  def coding(difficulty)
    ret = []
    ret << "start coding"
    case difficulty
    when DIFFICILTY::EASY
      ret << easy_coding
    when DIFFICILTY::NORMAL
      ret << normal_coding
    when DIFFICILTY::DIFFICILT
      ret << difficult_coding
    else
      fail 'error'
    end
    ret << "finish coding"
    ret.join("\n")
  end
end

# sample valid Concrete Class.
class StarDeveloper < BaseDeveloper
  def easy_coding
    "complete 1 minutes"
  end
  def normal_coding
    "complete 10 minutes"
  end
  def difficult_coding
    "complete 59 minutes"
  end
end

# sample invalid Concrete Class. if call NormalDeveloper#difficult_coding, it raises NotImplementedError.
class NormalDeveloper < BaseDeveloper
  def easy_coding
    "complete 10 minutes"
  end
  def normal_coding
    "complete 100 minutes"
  end
end
~~~

## Relation
if you are Sublime Text2 user, you can use snippet for TbpgrUtils.

https://github.com/tbpgr/tbpgr_utils_snippets

## History
* version 0.0.16 : add Array#together_select(or tselect, together_find_all, tfindall)
* version 0.0.15 : add Module.alias_methods
* version 0.0.14 : add Array#together_map(aliases => [tmap, together_collect, tcollect])
* version 0.0.13 : add Array#together_with_index, Kernel#bulk_puts_eval
* version 0.0.12 : AttributesInitializable::ClassMethods.attr_reader_init,attr_writer_init
* version 0.0.11 : add Object#to_bool.
* version 0.0.10 : add TemplateMethodable module.
* version 0.0.9  : add TestToolbox module. add Kernel#capture_stdout, Kernel#dp_line
* version 0.0.8  : add Kernel#bulk_define_methods
* version 0.0.7  : add Kernel#print_eval, Kernel#puts_eval
* version 0.0.6  : add Ghostable
* version 0.0.5  : add Templatable
* version 0.0.4  : AttributesInitializable::ClassMethods.attr_accessor_init
* version 0.0.3  : add Object#any_of?
* version 0.0.2  : loop all arrays by block.
* version 0.0.1  : first release.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
