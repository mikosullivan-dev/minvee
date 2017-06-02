#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require 'diff/lcs'
require_relative '../testmin.rb'

# enable taint mode
$SAFE = 1

################################################################################
# Array
#
class ::Array
	def show()
		return '[' + self.join(' | ') + ']'
	end
end
#
# Array
################################################################################


# get diff
myorg = ['a', 'b', 'c']
mynew = ['a.1', 'b', 'b.1', 'c', 'd', 'e']
mydiff = Diff::LCS.diff(myorg, mynew)

mydiff.each { |change|
	# TestMin.hr 'title' => change.class
	puts change.class
	
	change.each { |el|
		puts '[' + el.action + ' | ' + el.element + ' | ' + el.position.to_s + ']'
	}
}

__END__


# initialize merged
merged = myorg.clone


# build full array
TestMin.hr
mydiff.each { |change|
	change.each { |el|
		puts '[' + el.action + ' | ' + el.element + ' | ' + el.position.to_s + ']'
		
		if not merged[el.position].is_a?(Array)
			merged[el.position] = []
		end
		
		merged[el.position].push(el)
	}
}



# output merged
TestMin.hr
merged.each { |el|
	if el.is_a?(Array)
		changes = []
		
		el.each { |change|
			changes.push change.action + ' ' + change.element
		}
		
		puts '[ ' + changes.join(' | ') + ' ]'
	else
		puts el
	end
}


# done
# TestMin.done()
puts '[done]'

myorg = ['a', 'b', 'c']
mynew = ['a.1', 'b', 'b.1', 'c', 'd', 'e']


[
	['-', 'a'],
	['+', 'a.1'],
	['', 'b'],
]
