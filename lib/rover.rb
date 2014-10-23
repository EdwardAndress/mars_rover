class Rover

	DEFAULT_HEADING = 'N' #I chose to use a constant rather than hard code 'N' at initialize because it feels more descriptive
	DEFAULT_STARTING_POSITION = [0, 0]

	def initialize(heading: DEFAULT_HEADING, starting_position: DEFAULT_STARTING_POSITION )
		@heading = heading
		@position = starting_position
	end

	def position
		@position
	end

	def heading
		@heading
	end

	def change_heading_to(new_NSEW_heading) #change heading by passing N,S,E or W as a string
		@heading = new_NSEW_heading
	end

	def move
		if 		self.heading == 'N'
					@position[1] += 1
		elsif 	self.heading == 'S'
					@position[1] -= 1
		elsif 	self.heading == 'E'
					@position[0] +=1
		elsif 	self.heading == 'W'
					@position[0] -= 1
		else
			return "Invalid heading"
		end
	end

end