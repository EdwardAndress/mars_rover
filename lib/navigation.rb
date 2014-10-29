module Navigation

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

end