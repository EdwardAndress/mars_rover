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

	def heading_to_index
		headings = ["N", "E", "S", "W", "N"]
		headings.index(heading)
	end

	def index_to_heading(index)
		if index == -1
			return 'W'
		else
			["N", "E", "S", "W", "N"][index]
		end
	end

	def convert(instruction)
		index = self.heading_to_index
		if instruction == 'R'
			index += 1
		else
			index -= 1
		end
		return index_to_heading(index)
	end

	def accept_input(input) #takes input as list of instructions in a string then splits string to array and iterates through instructions
		input.chars.each do |instruction|
			if instruction == "M" #moves rover if command == M
				move
			else
				change_heading_to(convert(instruction)) #converts turn instruction to new heading then sets new heading
			end
		end
		report
	end

	def accept_plateau_data(size) #takes plateau size as two numbers separated by a space in a string eg . "5 5"
		@plateau = size.split(" ").map {|e| e.to_i}
	end

	def plateau_size
		@plateau
	end

	def safe_move?
		(position[0] || position[1]) >= 5 ? false : true
	end

	def change_heading_to(new_NSEW_heading) #change heading by passing N,S,E or W as a string
		@heading = new_NSEW_heading
	end

	def move
		if 		heading == 'N' && safe_move?
					@position[1] += 1
		elsif 	heading == 'S' && safe_move?
					@position[1] -= 1
		elsif 	heading == 'E' && safe_move?
					@position[0] += 1
		elsif 	heading == 'W' && safe_move?
					@position[0] -= 1
		else
			return "Invalid heading"
		end
	end

	def report
		"#{position.join(" ")} #{heading}" #reports position coordinates and heading for 'output'
	end

end