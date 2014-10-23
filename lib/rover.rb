class Rover

	def initialize
		@heading = 'N'
	end

	def position
		[0, 0]
	end

	def heading
		@heading
	end

	def change_heading_to(new_NSEW_heading) #change heading by passing N,S,E or W as a string
		@heading = new_NSEW_heading
	end

end