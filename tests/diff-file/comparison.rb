#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require_relative '../testing.lib.rb'

# enable taint mode
$SAFE = 1

# arrays
myorg = [ 'a',          'b',        'c', 'd',            ]
mynew = [ 'a.1', 'a.2', 'b', 'b.1', 'c', 'd', 'd.1', 'e' ]

# get comparison
mycomp = Minvee.comparison(myorg, mynew)
Minvee.show_comparison(mycomp)



# done
# Testmin.done()
puts '[done]'
