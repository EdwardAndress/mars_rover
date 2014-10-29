module Motor

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

end