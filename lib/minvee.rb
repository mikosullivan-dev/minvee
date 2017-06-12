#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require 'diff/lcs'


################################################################################
# Minvee
#
class Minvee
	
	#---------------------------------------------------------------------------
	# compare_arrays
	## Given two arrays of strings, uses Diff::LCS to produce a structure that
	## holds both complete arrays, and indicates the addition, subtraction or
	## staying the same for each element as the first array is transformed into
	## the second array.
	#
	def self.compare_arrays(myorg, mynew)
		# Testmin.hr(__method__.to_s)
		
		# get diff
		mydiff = Diff::LCS.sdiff(myorg, mynew)
		
		# initialize changes array
		changes_full = []
		changes_compact = []
		
		# build changes array
		mydiff.each do |change|
			# convenience
			myold = change.old_element
			mynew = change.new_element
			
			# if they're the same
			if myold == mynew
				changes_full.push ( {'action' => 's', 'str' => myold} )
			
			# else get old and new
			else
				# old element
				if not myold.nil?
					changes_full.push ( {'action' => '-', 'str' => myold} )
				end
				
				# new element
				if not mynew.nil?
					changes_full.push ( {'action' => '+', 'str' => mynew} )
				end
			end
		end
		
		# initialize latest action
		latest_action = ''
		
		# compact
		changes_full.each_with_index do |change, index|
			# if same action as last iteration
			if change['action'] == latest_action
				changes_compact[-1]['strs'].push(change['str'])
			
			# else different action
			else
				changes_compact.push( {'action'=>change['action'], 'strs'=>[change['str']] } )
				latest_action = change['action']
			end
		end
		
		# return
		return changes_compact
	end
	#
	# compare_arrays
	#---------------------------------------------------------------------------
	
	
	#---------------------------------------------------------------------------
	# show_comparison
	## A convienience method for displaying the contents of a comparison
	## structure. Don't use this method in production work.
	#
	def self.show_comparison(mycomp)
		# Testmin.hr(__method__.to_s)
		
		mycomp.each do |change|
			puts change['action'] + '  ' + change['strs'].show
		end
	end
	#
	# show_comparison
	#---------------------------------------------------------------------------
end
#
# Minvee
################################################################################
