#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require_relative '../testmin.rb'
require_relative '../../lib/minvee.rb'

# enable taint mode
$SAFE = 1

# arrays
myorg = [ 'a',          'b',        'c', 'd',            ]
mynew = [ 'a.1', 'a.2', 'b', 'b.1', 'c', 'd', 'd.1', 'e' ]

# compare
TestMin.hr
mycomp = Diff::LCS.comparison(myorg, mynew)
Diff::LCS::show(mycomp)
