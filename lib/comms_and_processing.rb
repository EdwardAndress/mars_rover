module CommsAndProcessing

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