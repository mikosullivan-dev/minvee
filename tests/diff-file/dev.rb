#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require_relative '../testmin.rb'
require_relative '../../lib/minvee.rb'

# enable taint mode
$SAFE = 1

# arrays
myorg = [ 'a',               'b',        'c', 'd',            ]
mynew = [      'a.1', 'a.2', 'b', 'b.1', 'c', 'd', 'd.1', 'e' ]

# verbosify
puts myorg.show
puts mynew.show
TestMin.hr

# get comparison
mycomp = Diff::LCS.comp(myorg, mynew)
Diff::LCS.show(mycomp)
TestMin.hr

# get comparison
mycomp = Diff::LCS.comp(['a'], ['b', 'a'])
Diff::LCS.show(mycomp)
