#!/usr/bin/ruby -w
system 'clear' unless ENV['clear_done']
require 'diff/lcs'


################################################################################
# Diff::LCS
#
module Diff::LCS
	def self.comp(myorg, mynew)
		# TestMin.hr(__method__.to_s)
		
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
			else
				changes_compact.push( {'action'=>change['action'], 'strs'=>[change['str']] } )
				latest_action = change['action']
			end
		end
		
		# return
		return changes_compact
	end
	
	def self.show(mycomp)
		# TestMin.hr(__method__.to_s)
		
		mycomp.each do |change|
			puts change['action'] + '  ' + change['strs'].show
		end
	end
end
#
# Diff::LCS
################################################################################
