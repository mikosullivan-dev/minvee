#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require_relative '../testing.lib.rb'

# enable taint mode
$SAFE = 1

# arrays
myorg = [ 'a',          'b',        'c', 'd',            ]
mynew = [ 'a.1', 'a.2', 'b', 'b.1', 'c', 'd', 'd.1', 'e' ]

# get comparison
mycomp = Minvee.compare_arrays(myorg, mynew)
Minvee.show_comparison(mycomp)

# should
# -  [a]
# +  [a.1|a.2]
# s  [b]
# +  [b.1]
# s  [c|d]
# +  [d.1|e]
should = [
	{'action'=>'-', 'strs'=>['a']},
	{'action'=>'+', 'strs'=>['a.1', 'a.2']},
	{'action'=>'s', 'strs'=>['b']},
	{'action'=>'+', 'strs'=>['b.1']},
	{'action'=>'s', 'strs'=>['c', 'd']},
	{'action'=>'+', 'strs'=>['d.1', 'e']},
]

# TESTING
Testmin.hr
Minvee.show_comparison(should)

# done
# Testmin.done()
puts '[done]'
