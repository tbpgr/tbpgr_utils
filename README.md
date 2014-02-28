# TbpgrUtils

[![Build Status](https://travis-ci.org/tbpgr/tbpgr_utils.png?branch=master)](https://travis-ci.org/tbpgr/tbpgr_utils)
[![Coverage Status](https://coveralls.io/repos/tbpgr/tbpgr_utils/badge.png)](https://coveralls.io/r/tbpgr/tbpgr_utils)
[![Code Climate](https://codeclimate.com/github/tbpgr/tbpgr_utils.png)](https://codeclimate.com/github/tbpgr/tbpgr_utils)

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
| class/module/method                                                                                               | mean                                                                                                                |
|:-----------                                                                                                       |:------------                                                                                                        |
|[TbpgrUtils Array#together](#arraytogether)                                                                        |loop all arrays by block                                                                                             |
|[TbpgrUtils Array#together_at](#arraytogether_at)                                                                  |together version of Array#at. together_at has alias :tat                                                             |
|[TbpgrUtils Array#together_clear](#arraytogether_clear)                                                            |together version of Array#clear. together_clear has alias :tclear                                                    |
|[TbpgrUtils Array#together_compact](#arraytogether_compact)                                                        |together version of Array#compact. together_compact has alias :tcompact. this is immutable.                          |
|[TbpgrUtils Array#together_compact!](#arraytogether_compact-1)                                                     |together version of Array#compact!. together_compact! has alias :tcompact! this is mutable.                          |
|[TbpgrUtils Array#together_concat](#arraytogether_concat)                                                          |together version of Array#concat. together_concat has alias :tconcat                                                 |
|[TbpgrUtils Array#together_delete](#arraytogether_delete)                                                          |together version of Array#delete. together_delete has alias :tdelete                                                 |
|[TbpgrUtils Array#together_delete_at](#arraytogether_delete_at)                                                    |together version of Array#delete_at. together_delete_at has alias :tdelete_at                                        |
|[TbpgrUtils Array#together_delete_if](#arraytogether_delete_if)                                                    |together version of Array#delete_if. together_delete_if has alias :tdelete_if                                        |
|[TbpgrUtils Array#together_empty?](#arraytogether_empty)                                                           |together version of Array#empty?. together_empty? has alias :tempty?                                                 |
|[TbpgrUtils Array#together_fill](#arraytogether_fill)                                                              |together version of Array#fill. together_fill has alias :tfill                                                       |
|[TbpgrUtils Array#together_first](#arraytogether_first)                                                            |together version of Array#first. together_first has alias :tfirst                                                    |
|[TbpgrUtils Array#together_include?](#arraytogether_include)                                                       |together version of Array#include?. together_include? has alias :tinclude?                                           |
|[TbpgrUtils Array#together_index](#arraytogether_index)                                                            |together version of Array#index. together_index has alias :tindex                                                    |
|[TbpgrUtils Array#together_insert](#arraytogether_insert)                                                          |together version of Array#insert. together_insert has alias :tinsert                                                 |
|[TbpgrUtils Array#together_last](#arraytogether_last)                                                              |together version of Array#last. together_last has alias :tlast                                                       |
|[TbpgrUtils Array#together_map](#arraytogether_mapor-tmap-together_collect-tcollect)                               |together version of Enumerable#map. together_map has aliases [:tmap, :together_collect, :tcollect]                   |
|[TbpgrUtils Array#together_map!](#arraytogether_mapor-tmap-together_collect-tcollect-1)                            |together version of Enumerable#map!. together_map! has aliases [:tmap!, :together_collect!, :tcollect!]              |
|[TbpgrUtils Array#together_pop](#arraytogether_popor-tpop)                                                         |together version of Array#pop. together_pop has alias :tpop                                                          |
|[TbpgrUtils Array#together_reduce](#arraytogether_reduceor-treduce-together_inject-tinject)                        |together version of Enumerable#reduce. together_reduce has aliases [:treduce, :together_inject, :tinject]            |
|[TbpgrUtils Array#together_reverse](#arraytogether_reverseor-treverse)                                             |together version of Array#reverse. together_reverse has alias :treverse                                              |
|[TbpgrUtils Array#together_reverse!](#arraytogether_reverseor-treverse-1)                                          |together version of Array#reverse!. together_reverse! has alias :treverse!                                           |
|[TbpgrUtils Array#together_sample](#arraytogether_sampleor-tsample)                                                |together version of Array#sample. together_sample has alias :tsample                                                 |
|[TbpgrUtils Array#together_select](#arraytogether_selector-tselect-together_find_all-tfindall)                     |together version of Enumerable#select. together_select has aliases [:tselect, :together_find_all, :tfindall]         |
|[TbpgrUtils Array#together_shift](#arraytogether_shift)                                                            |together version of Array#shift. together_shift has alias :tshift                                                    |
|[TbpgrUtils Array#together_shuffle](#arraytogether_shuffleor-tshuffle)                                             |together version of Array#shuffle. together_shuffle has alias :tshuffle                                              |
|[TbpgrUtils Array#together_slice](#arraytogether_sliceor-tslice)                                                   |together version of Array#slice. together_slice has alias :tslice                                                    |
|[TbpgrUtils Array#together_with_index](#arraytogether_with_index)                                                  |loop all arrays by block with index                                                                                  |
|[AttributesHashable.to_hash](#attributeshashableto_hash)                                                           |define to_hash method for get instance_values                                                                        |
|[AttributesInitializable::ClassMethods.attr_accessor_init](#attributesinitializableclassmethodsattr_accessor_init) |generate attr_accessor + initializer                                                                                 |
|[AttributesInitializable::ClassMethods.attr_reader_init](#attributesinitializableclassmethodsattr_reader_init)     |generate attr_reader + initializer                                                                                   |
|[AttributesInitializable::ClassMethods.attr_writer init](#attributesinitializableclassmethodsattr_writer_init)     |generate attr_writer + initializer                                                                                   |
|[EndERB.apply](#enderbapply)                                                                                       |for single template script using __END__ and DATA                                                                    |
|[KernelHelper#if_code](#kernelhelperif_code)                                                                       |create if strings, for eval                                                                                          |
|[TbpgrUtils File.insert_bom](#fileinsert_bom)                                                                      |insert BOM to UTF-8 File                                                                                             |
|[Ghostable module](#ghostable)                                                                                     |help to create ghost method(dynamic method define by ussing method_missing + pattern-method-name)                    |
|[TbpgrUtils Kernel#bulk_define_methods](#kernelbulk_define_methods)                                                |define methods to classes. methods have simple return value.                                                         |
|[TestToolbox Kernel#capture_stdout](#kernelcapture_stdout)                                                         |capture STDOUT                                                                                                       |
|[TestToolbox Kernel#dp_line](#kerneldp_line)                                                                       |debug print line for print-debugging                                                                                 |
|[TbpgrUtils Kernel#aa_ancestors](#kernelaa_ancestors)                                                              |Ascii Art Ancestors                                                                                                  |
|[TbpgrUtils Kernel#print_eval](#kernelprint_eval)                                                                  |Print code + eval result                                                                                             |
|[TbpgrUtils Kernel#puts_eval](#kernelputs_eval)                                                                    |Puts code + eval result                                                                                              |
|[TbpgrUtils Kernel#bulk_puts_eval](#kernelbulk_puts_eval)                                                          |Puts each-line-code + eval result                                                                                    |
|[MetasyntacticVariable](#metasyntacticvariable)                                                                    |META variable, META variable for classes                                                                             |
|[TbpgrUtils Module.alias_methods](#modulealias_methods)                                                            |create alias methods                                                                                                 |
|[TbpgrUtils Object#any_of?](#objectany_of)                                                                         |if self match any one of items, return true                                                                          |
|[TbpgrUtils Object#boolean?](#objectboolean)                                                                       |data type check for boolean                                                                                          |
|[TbpgrUtils Object#guard](#objectguard)                                                                            |data type check for guard                                                                                            |
|[TbpgrUtils Object#unless_guard](#objectunless_guard)                                                              |data type check for unless_guard                                                                                     |
|[TbpgrUtils Object#my_methods](#objectmy_methods)                                                                  |return public/protected/private self define methods                                                                  |
|[TbpgrUtils Object#to_bool](#objectto_bool)                                                                        |syntax sugar of !!. convert [false, nil] => fasel, other => true.                                                    |
|[TbpgrUtils String#justify_table](#stringjustify_table)                                                            |justify pipe format table string                                                                                     |
|[TbpgrUtils String#say](#stringsay)                                                                                |say string                                                                                                           |
|[TbpgrUtils String#stripe](#stringstripe)                                                                          |stripe string                                                                                                        |
|[TbpgrUtils String#surround](#stringsurround)                                                                      |surround string                                                                                                      |
|[TbpgrUtils String#to_hatena_heading](#stringto_hatena_heading)                                                    |create hatena-format heading string with Emmet-like grammar                                                          |
|[TbpgrUtils String#to_markdown_heading](#stringto_markdown_heading)                                                |create markdown-format heading string with Emmet-like grammar                                                        |
|[TbpgrUtils String#to_space2_heading](#stringto_space2_heading)                                                    |create space2-format heading string with Emmet-like grammar                                                          |
|[TbpgrUtils String#to_space4_heading](#stringto_space4_heading)                                                    |create space4-format heading string with Emmet-like grammar                                                          |
|[TbpgrUtils String#to_tab_heading](#stringto_tab_heading)                                                          |create tab-format heading string with Emmet-like grammar                                                             |
|[Templatable module](#templatable)                                                                                 |get result from template + placeholder                                                                               |
|[TemplateMethodable module](#templatemethodable)                                                                   |for Template Method Pattern                                                                                          |

### Array#together
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 4 3}
[alpha, numbers].together do |first, second|
  print "#{first}:#{second}\n"  # => output one:1, two:2, three:3
end
~~~

[back to list](#list)

### Array#together_at
~~~ruby
require 'tbpgr_utils'

# same elements size case
alpha = %w{one two three}
numbers = %w{1 2 3}
print [alpha, numbers].together_at 2 # => output ['three', 3]

# different elements size case
alpha = %w{one two three}
numbers = %w{1 2}
print [alpha, numbers].together_at 2 # => output ['three', nil]
~~~

[back to list](#list)

### Array#together_clear
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
[alpha, numbers].together_clear # => [[], []]
~~~

[back to list](#list)

### Array#together_compact
~~~ruby
require 'tbpgr_utils'

alpha = ['a','b','c', nil,'d']
numbers = [1, 2, nil, 3]
lists = [alpha, numbers]
ret = lists.together_compact
print lists # => output [['a','b','c', nil,'d'], [1, 2, nil, 3]]
print ret # => output [['a','b','c','d'], [1, 2, 3]]
~~~

[back to list](#list)

### Array#together_compact!
~~~ruby
require 'tbpgr_utils'

alpha = ['a','b','c', nil,'d']
numbers = [1, 2, nil, 3]
lists = [alpha, numbers]
ret = lists.together_compact!
print lists # => output [['a','b','c','d'], [1, 2, 3]]
print ret # => output [['a','b','c','d'], [1, 2, 3]]
~~~

[back to list](#list)

### Array#together_concat
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
[alpha, numbers].together_concat [4, 5, 6]

print alpha # => ["one", "two", "three", 4, 5, 6]
print numbers # => ["1", "2", "3", 4, 5, 6]
~~~

[back to list](#list)

### Array#together_delete
~~~ruby
require 'tbpgr_utils'

child1 = [1, 2, 3, 4]
child2 = [2, 3, 4, 5]
lists = [child1, child2]
ret = lists.together_delete 2
print lists # => output [[1, 3, 4], [3, 4, 5]]
~~~

if delete target is not exist
~~~ruby
require 'tbpgr_utils'

child1 = [1, 2, 3, 4]
child2 = [2, 3, 4, 5]
lists = [child1, child2]
ret = lists.together_delete 6
print ret # => nil
print lists # => output [[1, 2, 3, 4], [2, 3, 4, 5]]
~~~

if delete target is not exist and use block
~~~ruby
require 'tbpgr_utils'

child1 = [1, 2, 3, 4]
child2 = [2, 3, 4, 5]
lists = [child1, child2]
ret = lists.together_delete(6) { 999 }
print ret # => 999
print lists # => output [[1, 2, 3, 4], [2, 3, 4, 5]]
~~~

[back to list](#list)

### Array#together_delete_at
if delete_at target is exist
~~~ruby
require 'tbpgr_utils'

child1 = [1, 2, 3, 4]
child2 = [2, 3, 4, 5]
lists = [child1, child2]
ret = lists.together_delete_at 2
print ret # => [3, 4]
print lists # => output [[1, 2, 4], [2, 3, 5]]
~~~

if delete_at target is not exist
~~~ruby
require 'tbpgr_utils'

child1 = [1, 2, 3, 4]
child2 = [2, 3, 4, 5]
lists = [child1, child2]
ret = lists.together_delete_at 6
print ret # => [nil, nil]
print lists # => output [[1, 2, 3, 4], [2, 3, 4, 5]]
~~~

if delete_at target is exist(minus index)
~~~ruby
require 'tbpgr_utils'

child1 = [1, 2, 3, 4]
child2 = [2, 3, 4, 5]
lists = [child1, child2]
ret = lists.together_delete_at -3
print ret # => [2, 3]
print lists # => output [[1, 3, 4], [2, 4, 5]]
~~~

[back to list](#list)

### Array#together_delete_if
if delete_if target is exist
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2, 3, 4], [6, 4, 6, 8]]
ret = lists.together_delete_if {|first, second|(first + second).odd?}
print ret # => [[2, 4], [4, 8]]
~~~

if delete_if target is not exist. return nil.
~~~ruby
require 'tbpgr_utils'

lists = [[2, 2, 4, 4], [6, 4, 6, 8]]
ret = lists.together_delete_if {|first, second|(first + second).odd?}
print ret # => nil
~~~

[back to list](#list)

### Array#together_empty?
empty case
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_empty?
print ret # => true
~~~

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1], []]
ret = lists.together_empty?
print ret # => false
~~~

[back to list](#list)

### Array#together_fill
not use block case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_fill(99)
print ret # => [[99, 99, 99, 99, 99], [99, 99, 99, 99, 99]]
~~~

use block, no args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_fill { |i|(i + 1) + 1 }
print ret # => [[2, 3, 4, 5, 6], [2, 3, 4, 5, 6]]
~~~

use block, has args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_fill(2) { |i|(i + 1) + 1 }
print ret # => [[1, 2, 4, 5, 6], [6, 7, 4, 5, 6]]
~~~

[back to list](#list)

### Array#together_first
no args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_first
print ret # => [1, 6]
~~~

has args 2 case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_first 2
print ret # => [[1, 2], [6, 7]]
~~~

has args 0 case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_first 0
print ret # => [[], []]
~~~

has args over size case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_first 6
print ret # => [[*1..5], [*6..10]]
~~~

[back to list](#list)

### Array#together_include?
together_include? is bulk version of Array#include?

together_include? has alias :tinclude?

both include single ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_include? 5
print ret # => true
~~~

one include single ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_include? 9
print ret # => true
~~~

both not include single ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_include? 10
print ret # => false
~~~

both include multi ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_include? 5, true
print ret # => [true, true]
~~~

one include multi ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_include? 9, true
print ret # => [false, true]
~~~

both not include multi ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_include? 10, true
print ret # => [false, false]
~~~

[back to list](#list)

### Array#together_index
together_index has alias :tindex

both index exist case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_index 5
print ret # => [4, 0]
~~~

one include single ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_index 4
print ret # => [3, nil]
~~~

both not include single ret case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_index 10
print ret # => [nil, nil]
~~~

[back to list](#list)

### Array#together_insert
together_insert has alias :tinsert

both insert exist case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_insert(1, 55, 66)
print ret # => [[1, 55, 66, 2, 3, 4, 5], [5, 55, 66, 6, 7, 8, 9]]
~~~

both insert exist and minus index case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_insert(-2, 55, 66)
print ret # => [[1, 2, 3, 4, 55, 66, 5], [5, 6, 7, 8, 55, 66, 9]]
~~~

both insert exist case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*5..9]]
ret = lists.together_insert(6, 55, 66)
print ret # => [[1, 2, 3, 4, 5, nil, 55, 66], [5, 6, 7, 8, 9, nil, 55, 66]],
~~~

[back to list](#list)

### Array#together_last
together_last has alias :tlast

no args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_last
print ret # => [5, 10]
~~~

has args 2 case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_last 2
print ret # => [[4, 5], [9, 10]]
~~~

has args 0 case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_last 0
print ret # => [[], []]
~~~

has args over size case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_last 6
print ret # => [[*1..5], [*6..10]]
~~~

[back to list](#list)

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

[back to list](#list)

### Array#together_map!(or tmap!, together_collect!, tcollect!)
if you want to return single array, following.
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
ary = [alpha, numbers]
ret = ary.together_map! do |first, second|
  "#{first}:#{second}"
end
print ret # => output ['one:1', 'two:2', 'three:3']
print ary # => output ['one:1', 'two:2', 'three:3']
~~~

if you want to return multi array, following.
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
ary = [alpha, numbers]
ret = ary.together_map! do |first, second|
  ["#{first}:#{second}", "#{second}:#{first}"]
end
print ret # => output [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']]
print ary # => output [['1:one', '2:two', '3:three'], ['one:1', 'two:2', 'three:3']]
~~~

[back to list](#list)

### Array#together_pop(or tpop)
together_pop has alias :tpop

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_pop
print ret # => [2, 6]
print lists # => [1, 5]
~~~

empty case
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_pop
print ret # => [nil, nil]
print lists # => [[], []]
~~~

not empty case with args
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_pop 2
print ret # => [[1, 2], [5, 6]]
print lists # => [[], []]
~~~

not empty case with args
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_pop 2
print ret # => [[], []]
print lists # => [[], []]
~~~

[back to list](#list)

### Array#together_reduce(or :treduce, :together_inject, :tinject)
* if you want to single return

~~~ruby
require 'tbpgr_utils'

firsts = [1, 2, 3, 4]
seconds =  [4, 2, 3, 1]
ret = [firsts, seconds].together_reduce{|memo, first, second|memo + first + second}
print ret # => output  20
~~~

* if you want to single return with init value

~~~ruby
require 'tbpgr_utils'

firsts = [1, 2, 3, 4]
seconds =  [4, 2, 3, 1]
ret = [firsts, seconds].together_reduce(10){|memo, first, second|memo + first + second}
print ret # => output  30
~~~

* if you want to single return with init string value

~~~ruby
require 'tbpgr_utils'

firsts = %w{a b c}
seconds =  %w{1 2 3}
ret = [firsts, seconds].together_reduce('start-'){|memo, first, second|memo + first + second}
print ret # => output 'start-a1b2c3'
~~~

* if you want to single return with init Array value

~~~ruby
require 'tbpgr_utils'

firsts = [1, 2, 3, 4]
seconds =  [4, 2, 3, 1]
ret = [firsts, seconds].together_reduce([]){|memo, first, second|memo << first + second}
print ret # => output [5, 4, 6, 5]
~~~

* if you want to single return with init Hash value

~~~ruby
require 'tbpgr_utils'

firsts = [1, 2, 3, 4]
seconds =  [4, 2, 3, 1]
ret = [firsts, seconds].together_reduce({}){|memo, first, second|memo[first] = second;memo}
print ret # => output {1=>4, 2=>2, 3=>3, 4=>1}
~~~

[back to list](#list)

### Array#together_reverse(or :treverse)
together_reverse has alias :treverse

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_reverse
print ret # => [[2, 1], [6, 5]]
print lists # => [[1, 2], [5, 6]]
~~~

one empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], []]
ret = lists.together_reverse
print ret # => [[2, 1], []]
print lists # => [[1, 2], []]
~~~

[back to list](#list)

### Array#together_reverse!(or :treverse!)
together_reverse! has alias :treverse!

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_reverse!
print ret # => [[2, 1], [6, 5]]
print lists # => [[2, 1], [6, 5]]
~~~

one empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], []]
ret = lists.together_reverse!
print ret # => [[2, 1], []]
print lists # => [[2, 1], []]
~~~

[back to list](#list)

### Array#together_sample(or :tsample)
together_sample has alias :tsample

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_sample
print ret # => [1 or 2, 5 or 6]
~~~

empty case
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_sample
print ret # => [nil, nil]
~~~

not empty case with args
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_sample 2
print ret # => [[1 or 2, 1 or 2], [5 or 6, 5 or 6]] 
~~~

not empty case with args
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_sample 2
print ret # => [[], []]
~~~

not empty, over size case with args
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_sample 3
print ret # => [[1 or 2, 1 or 2], [5 or 6, 5 or 6]] 
~~~

[back to list](#list)

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

[back to list](#list)

### Array#together_shift(or tshift)
together_shift has alias :tshift

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_shift
print ret # => [1, 5]
print lists # => [2, 6]
~~~

empty case
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_shift
print ret # => [nil, nil]
print lists # => [[], []]
~~~

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_shift 2
print ret # => [[1, 2], [5, 6]]
print lists # => [[], []]
~~~

not empty case
~~~ruby
require 'tbpgr_utils'

lists = [[], []]
ret = lists.together_shift 2
print ret # => [[], []]
print lists # => [[], []]
~~~

[back to list](#list)

### Array#together_shuffle(or :tshuffle)
together_shuffle has alias :tshuffle

~~~ruby
require 'tbpgr_utils'

lists = [[1, 2], [5, 6]]
ret = lists.together_shuffle
print ret # => [[1 or 2, 1 or 2], [5 or 6, 5 or 6]]
~~~

[back to list](#list)

### Array#together_slice(or :tslice)
single args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_slice 2
print ret # => [3, 8]
~~~

multi args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_slice 2, 2
print ret # => [[3, 4], [8, 9]]
~~~

range args case
~~~ruby
require 'tbpgr_utils'

lists = [[*1..5], [*6..10]]
ret = lists.together_slice (2..3)
print ret # => [[3, 4], [8, 9]]
~~~

[back to list](#list)

### Array#together_with_index
~~~ruby
require 'tbpgr_utils'

alpha = %w{one two three}
numbers = %w{1 2 3}
[alpha, numbers].together_with_index do |first, second, index|
  print "#{index.to_s}:#{first}:#{second}\n"  # => output 0:one:1, 1:two:2, 2:three:3
end
~~~

[back to list](#list)

### AttributesHashable.to_hash
~~~ruby
require 'attributes_initializable'
require 'attributes_hashable'

class Hoge
  include AttributesInitializable
  attr_accessor_init :hoge, :hige
  include AttributesHashable
end

hoge = Hoge.new do |h|
  h.hoge = 'hoge'
  h.hige = 'hige'
end

hoge.to_hash # => {:hoge=>"hoge", :hige=>"hige"}

# After include AttributesHashable, you can use Hash.try_convert.
Hash.try_convert hoge # => {:hoge=>"hoge", :hige=>"hige"}
~~~

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

### EndERB.apply
for single template script using __END__ and DATA

sample case

~~~ruby
require "end_erb"

def hoge
  hash = {
    hoge: '@hoge@',
    hige: '@hige@',
  }
  EndERB.apply(hash)
end

puts hoge

__END__
hoge=<%=hash[:hoge]%>
hige=<%=hash[:hige]%>
~~~

output

~~~
hoge=@hoge@
hige=@hige@
~~~

[back to list](#list)

### File.insert_bom
* this method's main purpose is 'UTF-8 Excel CSV File'.

output bommed text from input.csv to output.csv
~~~ruby
require 'tbpgr_utils'

File.insert_bom("input.csv", "output.csv") # => output bommed text to output.csv
~~~

output bommed text from input.csv to input.csv
~~~ruby
require 'tbpgr_utils'

File.insert_bom("input.csv") # => output bommed text to output.csv
~~~

[back to list](#list)

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

[back to list](#list)

### Kernel#capture_stdout
capture STDOUT to String. This method can use in STDOUT contents test.

~~~ruby
require 'test_toolbox'

result = capture_stdout {puts "test"} # => "test"

# no stdout case. return empty.
result = capture_stdout {sleep 0.1} # => ""(empty)
~~~

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

### Kernel#aa_ancestors
Ascii Airt Ancestors

~~~ruby
class BaseHogeForAncestors;end
class HogeForAncestors < BaseHogeForAncestors;end

puts HogeForAncestors.aa_ancestors
~~~

result is ...

~~~
----------------------
|     BasicObject    |
----------------------
          |
----------------------
|       Kernel       |
----------------------
          |
----------------------
|       Object       |
----------------------
          |
----------------------
|BaseHogeForAncestors|
----------------------
          |
----------------------
|  HogeForAncestors  |
----------------------
~~~

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

### KernelHelper#if_code

if case

~~~ruby
class EvalHelperTest
  include EvalHelper

  def hoge(hash)
    msg = hash[:input]
    code = if_code(hash[:if_cond], hash[:if_proc], hash[:else_proc])
    instance_eval code
  end
end

hash = {
  input: "test",
  if_cond: "msg == 'test'",
  if_proc: "test",
  else_proc: "false",
}
EvalHelperTest.new.hoge(hash) # => return true
~~~

else case

~~~ruby
class EvalHelperTest
  include EvalHelper

  def hoge(hash)
    msg = hash[:input]
    code = if_code(hash[:if_cond], hash[:if_proc], hash[:else_proc])
    instance_eval code
  end
end

hash = {
  input: "not_test",
  if_cond: "msg == 'test'",
  if_proc: "test",
  else_proc: "false",
}
EvalHelperTest.new.hoge(hash) # => return false
~~~

[back to list](#list)

### MetasyntacticVariable
* META variable

~~~ruby
MetasyntacticVariable::META_VARIABLES  # => [:foo, :bar, :baz, :qux, :quux, :corge, :grault, :garply, :waldo, :fred, :plugh, :xyzzy, :thud]
MetasyntacticVariable.meta_variables  # => [:foo, :bar, :baz, :qux, :quux, :corge, :grault, :garply, :waldo, :fred, :plugh, :xyzzy, :thud]
~~~

* META variable for classes

~~~ruby
MetasyntacticVariable::META_CLASSES  # => [:foo, :bar, :baz, :qux, :quux, :corge, :grault, :garply, :waldo, :fred, :plugh, :xyzzy, :thud]
MetasyntacticVariable.meta_classes  # => [:foo, :bar, :baz, :qux, :quux, :corge, :grault, :garply, :waldo, :fred, :plugh, :xyzzy, :thud]
~~~

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

### Object#boolean?
~~~ruby
require 'tbpgr_utils'

p true.boolean?    # =>true
p false.boolean?   # =>true
p nil.boolean?     # =>false
p "".boolean?      # =>false
p "true".boolean?  # =>false
~~~

[back to list](#list)

### Object#guard
guard return case

~~~ruby
def hoge(msg)
  guard(msg) {return "guard"}
  "not guard"
end

hoge true # => "guard"
hoge false # => "not guard"
~~~

guard fail case

~~~ruby
def hoge(msg)
  guard(msg) {fail ArgumentError, 'error!!'}
  "not guard"
end

hoge true # => raise ArgumentError. message = error!!
hoge false # => "not guard"
~~~

[back to list](#list)

### Object#unless_guard
unless_guard return case

~~~ruby
def hoge(msg)
  unless_guard(msg) {return "unless_guard"}
  "not unless_guard"
end

hoge false # => "unless_guard"
hoge true # => "not unless_guard"
~~~

unless_guard fail case

~~~ruby
def hoge(msg)
  unless_guard(msg) {fail ArgumentError, 'error!!'}
  "not unless_guard"
end

hoge false # => raise ArgumentError. message = error!!
hoge true # => "not unless_guard"
~~~

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

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

[back to list](#list)

### String#say
default case
~~~ruby
'hoge'.say # => 'hoge'
~~~

quote case
~~~ruby
'hoge'.say(:quote) # => 'hoge'
~~~

dquote case
~~~ruby
'hoge'.say(:dquote) # => "hoge"
~~~

bracket case
~~~ruby
'hoge'.say(:bracket) # => [hoge]
~~~

hyphen case
~~~ruby
'hoge'.say(:hyphen) # => -hoge-
~~~

[back to list](#list)

### String#stripe
default case
~~~ ruby
require 'tbpgr_utils'

'hoge'.stripe # => HoGe
~~~

lower_cap case
~~~ruby
require 'tbpgr_utils'

'hoge'.stripe :lower_cap # => hOgE
~~~

empty case
~~~ruby
require 'tbpgr_utils'

''.stripe # => ''
~~~

nil case
~~~ruby
require 'tbpgr_utils'

hoge = nil
hoge.stripe # => nil
~~~

[back to list](#list)

### String#surround
single line, no option case

~~~ruby
require 'tbpgr_utils'
'hoge'.surround
~~~

result

~~~
------
|hoge|
------
~~~

multi line, no option case

~~~ruby
require 'tbpgr_utils'
"hoge\na".surround
~~~

result

~~~
------
|hoge|
|a   |
------
~~~

single line, both option case

~~~ruby
require 'tbpgr_utils'
'hoge'.surround top_bottom: '=', side: '!'
~~~

result

~~~
======
!hoge!
======
~~~

[back to list](#list)

### String#to_hatena_heading
&gt; case
~~~ruby
require 'tbpgr_utils'
'hoge>hige'.to_hatena_heading # => '*hoge\n**hige'
~~~

\+ case
~~~ruby
require 'tbpgr_utils'

'hoge+hige'.to_hatena_heading # => '*hoge\n*hige'
~~~

^ case
~~~ruby
require 'tbpgr_utils'
'hoge>hige^hege'.to_hatena_heading # => '*hoge\n**hige\n*hege'
~~~


[back to list](#list)

### String#to_markdown_heading
&gt; case
~~~ruby
require 'tbpgr_utils'
'hoge>hige'.to_markdown_heading # => '# hoge\n## hige'
~~~

\+ case
~~~ruby
require 'tbpgr_utils'

'hoge+hige'.to_markdown_heading # => '# hoge\n# hige'
~~~

^ case
~~~ruby
require 'tbpgr_utils'
'hoge>hige^hege'.to_markdown_heading # => '# hoge\n## hige\n# hege'
~~~

[back to list](#list)

### String#to_space2_heading
&gt; case
~~~ruby
require 'tbpgr_utils'
'hoge>hige'.to_space2_heading # => 'hoge\n  hige'
~~~

\+ case
~~~ruby
require 'tbpgr_utils'

'hoge+hige'.to_space2_heading # => 'hoge\nhige'
~~~

^ case
~~~ruby
require 'tbpgr_utils'
'hoge>hige^hege'.to_space2_heading # => 'hoge\n  hige\nhege'
~~~

[back to list](#list)

### String#to_space4_heading
&gt; case
~~~ruby
require 'tbpgr_utils'
'hoge>hige'.to_space4_heading # => 'hoge\n    hige'
~~~

\+ case
~~~ruby
require 'tbpgr_utils'
'hoge+hige'.to_space4_heading # => 'hoge\nhige'
~~~

^ case
~~~ruby
require 'tbpgr_utils'
'hoge>hige^hege'.to_space4_heading # => 'hoge\n    hige\nhege'
~~~

[back to list](#list)

### String#to_tab_heading
&gt; case
~~~ruby
require 'tbpgr_utils'
'hoge>hige'.to_tab_heading # => 'hoge\n\thige'
~~~

\+ case
~~~ruby
require 'tbpgr_utils'
'hoge+hige'.to_tab_heading # => 'hoge\nhige'
~~~

^ case
~~~ruby
require 'tbpgr_utils'
'hoge>hige^hege'.to_tab_heading # => 'hoge\n\thige\nhege'
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

[back to list](#list)

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
* version 0.0.51 : add KernelHelper#if_code
* version 0.0.50 : add String#to_markdown_heading
* version 0.0.49 : add String#to_tab_heading
* version 0.0.48 : add String#to_space4_heading
* version 0.0.47 : add String#to_space2_heading
* version 0.0.46 : add String#stripe
* version 0.0.45 : add String#say
* version 0.0.44 : add EndERB.apply
* version 0.0.43 : add Array#together_slice(alias tslice).
* version 0.0.42 : add MetasyntacticVariable
* version 0.0.41 : add Object#guard, unless_guard
* version 0.0.40 : add Kernel#aa_ancestors.
* version 0.0.39 : add String#surround.
* version 0.0.38 : add Array#together_shuffle(alias tshuffle).
* version 0.0.37 : add Array#together_sample(alias tsample).
* version 0.0.36 : add Array#together_reverse,Array#together_reverse!(alias treverse, alias treverse!).
* version 0.0.35 : add Array#together_pop(alias tpop).
* version 0.0.34 : add Array#together_last(alias tlast).
* version 0.0.33 : add Array#together_shift(alias tshift).
* version 0.0.32 : add Array#together_insert(alias tinsert).
* version 0.0.31 : add Array#together_index(alias tindex).
* version 0.0.30 : add Array#together_include?(alias tinclude?).
* version 0.0.29 : add Array#together_first(alias tfirst).
* version 0.0.28 : add Array#together_fill(alias tfill). add File.insert_bom.
* version 0.0.27 : add Array#together_empty?(alias tempty?)
* version 0.0.26 : add Array#together_delete_if(alias tdelete_if)
* version 0.0.25 : add Array#together_delete_at(alias tdelete_at)
* version 0.0.24 : add Array#together_delete(alias tdelete)
* version 0.0.23 : add Array#together_map!(aliases => [tmap!, together_collect!, tcollect!])
* version 0.0.22 : add Array#together_compact. together_compact has alias :tcompact. Array#together_compact!. together_compact! has alias :tcompact!.
* version 0.0.21 : add Array#together_clear. together_clear has alias :tclear
* version 0.0.20 : add Array#together_at. together_at has alias :tat
* version 0.0.19 : add AttributesHashable module.
* version 0.0.18 : add Array#together_concat. together_concat has alias tconcat
* version 0.0.17 : add Array#together_reduce(or treduce, together_inject, tinject)
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
