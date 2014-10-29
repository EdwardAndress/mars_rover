require_relative './motor.rb'
require_relative './steering.rb'
require_relative './navigation.rb'

class Rover #used to explore a rectangular plateau and can be fed a list of commands in a string

	include Motor
	include Steering
	include Navigation

	def initialize(heading: heading, starting_position: starting_position, plateau_size: plateau_size)
		@heading = heading || 'N'					#I would like to assign the defaults to named constants but this causes rovers to 
		@position = starting_position || [0, 0]		#be instantiated with the wrong start position in some cases and I don't know why
		@plateau_size = plateau_size || [5, 5]		#default plateau size set to [5, 5]
		@errors = [] #array to store the rover error log
		@positions_log = [] #array to contain all positions visited
		@total_plateau_area = (@plateau_size[1] + 1) * (@plateau_size[0] + 1)
	end

	attr_reader :position, :heading, :instructions, :plateau_size, :errors, :positions_log, :total_plateau_area

	def format_input(input) #converts input string into an array
		@instructions = input.chars
	end

	def run_instructions #takes instructions array and iterates through, dealing with each one appropriately
		@instructions.each do |instruction|
			instruction == "M" ? self.move : change_heading_to(new_heading_from(instruction))
		end
		report
	end

	def accept_plateau_data(size) #takes plateau size as two numbers separated by a space in a string eg . "5 5"
		@plateau_size = size.split(" ").map {| dimension | dimension.to_i}
	end

	def report
		"#{position.join(" ")} #{heading}" #reports position coordinates and heading for 'output'
	end

end