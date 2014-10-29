class Rover #used to explore a rectangular plateau and can be fed a list of commands in a string

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

	def move_to_south_western_corner
		move_to_southern_edge
		move_to_western_edge
	end

	def distance_to_western_edge
		position[0]
	end

	def move_to_western_edge
		change_heading_to('W') #decided to change heading and use move since the test states that the rover has to move in the direction its facing - using the heading-independent methods would have been cheating!
		distance_to_western_edge.times { move }
	end

	def distance_to_southern_edge
		position[1]
	end

	def move_to_southern_edge
		change_heading_to('S') #decided to change heading and use move since the test states that the rover has to move in the direction its facing - using the heading-independent methods would have been cheating!
		distance_to_southern_edge.times { move }
	end

	def distance_to_northern_edge
		plateau_size[1] - position[1]
	end

	def move_to_northern_edge
		change_heading_to('N') #decided to change heading and use move since the test states that the rover has to move in the direction its facing - using the heading-independent methods would have been cheating!
		distance_to_northern_edge.times { move }
	end

	def face_opposite_edge
		if position[1] == 0
			change_heading_to('N')
		elsif position[1] == plateau_size[1]
			change_heading_to('S')
		elsif position[0] == 0
			change_heading_to('E')
		elsif position[0] == plateau_size[0]
			change_heading_to('W')
		else
			self.heading
		end	
	end

	def explore

		move_to_south_western_corner

		until positions_log.count == total_plateau_area
			face_opposite_edge
			(plateau_size[1]).times { move }
			change_heading_to('E')
			move
		end
	end

	def current_heading_numerical #converts N/S/E/W heading to a numerical value for manipulation by turn instructions
		["N", "E", "S", "W", "N"].index(heading)
	end

	def heading_alphabetical(heading_numerical) #converts a numerical value into N/S/E/W heading - does not use current heading, it uses 
		heading_numerical == -1 ? 'W' : ["N", "E", "S", "W", "N"][heading_numerical]
	end

	def turn_right #used to add 1 to numberical heading
		heading_alphabetical((current_heading_numerical) + 1)
	end

	def turn_left #used to subtract 1 from numerical heading
		heading_alphabetical((current_heading_numerical) - 1)
	end

	def new_heading_from(instruction) #converts 'L' or 'R' turn instructions into a new heading
		instruction == 'R' ? turn_right : turn_left
	end


	def change_heading_to(new_heading) #change heading by passing N,S,E or W as a string
		@heading = new_heading
	end

	def accept_plateau_data(size) #takes plateau size as two numbers separated by a space in a string eg . "5 5"
		@plateau_size = size.split(" ").map {| dimension | dimension.to_i}
	end

	def safe_move_north? #checks whether rover will fall off the plateau by moving North
		@position[1] < @plateau_size[1]
	end

	def safe_move_south? #checks whether rover will fall off the plateau by moving South
		@position[1] > 0
	end

	def safe_move_east? #checks whether rover will fall off the plateau by moving East
		@position[0] < @plateau_size[0]
	end

	def safe_move_west? #checks whether rover will fall off the plateau by moving West
		@position[0] > 0
	end

	def move_north
		@position[1] += 1
	end

	def move_south
		@position[1] -= 1
	end

	def move_east
		@position[0] += 1
	end

	def move_west
		@position[0] -= 1
	end

	def move
		if 		heading == 'N' && safe_move_north?
					move_north
					@positions_log << report
		elsif 	heading == 'S' && safe_move_south?
					move_south
					@positions_log << report
		elsif 	heading == 'E' && safe_move_east?
					move_east
					@positions_log << report 					
		elsif 	heading == 'W' && safe_move_west?
					move_west
					@positions_log << report
		else
			@errors << {Time.now => "Invalid move (aborted) at #{@position} heading #{heading}"}
		end
	end

	def report
		"#{position.join(" ")} #{heading}" #reports position coordinates and heading for 'output'
	end

end