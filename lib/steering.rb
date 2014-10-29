module Steering

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

end