class Rover #used to explore a rectangular plateau and can be fed a list of commands in a string

	def initialize(heading: heading, starting_position: starting_position, plateau_size: plateau_size)
		@heading = heading || 'N'					#I would like to assign the defaults to named constants but this causes rovers to 
		@position = starting_position || [0, 0]		#be instantiated with the wrong start position in some cases and I don't know why
		@plateau_size = plateau_size || [5, 5]		#default plateau size set to [5, 5]
	end

	def position #output current position on the plateau
		@position
	end

	def heading #output current heading/orientation: N = North, S = South, E = East, W = West
		@heading
	end

	def current_heading_numerical #converts heading to a numerical value for manipulation by turn instructions
		["N", "E", "S", "W", "N"].index(heading)
	end

	def heading_alphabetical(heading_numerical) #converts numerical value into heading
		heading_numerical == -1 ? 'W' : ["N", "E", "S", "W", "N"][heading_numerical]
	end

	def turn_right
		1
	end

	def turn_left
		-1
	end

	def new_heading_from(instruction) #converts 'L' or 'R' turn instructions into a new heading
		instruction == 'R' ? heading_alphabetical((current_heading_numerical) + turn_right) : heading_alphabetical((current_heading_numerical) + turn_left)
	end

	def format_input(input)
		@instructions = input.chars
	end

	def run_instructions #takes input as list of instructions in a string then splits string to array and iterates through instructions
		@instructions.each do |instruction|
			instruction == "M" ? self.move : change_heading_to(new_heading_from(instruction))
		end
		report
	end

	def accept_plateau_data(size) #takes plateau size as two numbers separated by a space in a string eg . "5 5"
		@plateau_size = size.split(" ").map {|e| e.to_i}
	end

	def plateau_size #output plateau size
		@plateau_size
	end

	def safe_move_north? #checks whether rover will fall off the plateau by moving North
		@position[1] < @plateau_size[1]
	end

	def safe_move_south? #checks whether rover will fall off the plateau by moving North
		@position[1] > 0
	end

	def safe_move_east? #checks whether rover will fall off the plateau by moving North
		@position[0] < @plateau_size[0]
	end

	def safe_move_west? #checks whether rover will fall off the plateau by moving North
		@position[0] > 0
	end

	def change_heading_to(new_NSEW_heading) #change heading by passing N,S,E or W as a string
		@heading = new_NSEW_heading
	end

	def move
		if 		heading == 'N' && safe_move_north?
					@position[1] += 1
		elsif 	heading == 'S' && safe_move_south?
					@position[1] -= 1
		elsif 	heading == 'E' && safe_move_east?
					@position[0] += 1
		elsif 	heading == 'W' && safe_move_west?
					@position[0] -= 1
		else
			return "Invalid heading"
		end
	end

	def report
		"#{position.join(" ")} #{heading}" #reports position coordinates and heading for 'output'
	end

end