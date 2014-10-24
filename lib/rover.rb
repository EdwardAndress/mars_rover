class Rover

	def initialize(heading: heading, starting_position: starting_position)
		@heading = heading || 'N'					#I would like to assign the defaults to named constants but this causes rovers to 
		@position = starting_position || [0, 0]		#be instantiated with the wrong start position in some cases and I don't know why
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