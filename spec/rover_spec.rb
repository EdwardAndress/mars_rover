require 'rover'

describe Rover do

let(:rover) 		{Rover.new}					#rover for testing
let(:e_rover) 		{Rover.new(heading: 'E')} 	#new rover heading East
let(:s_rover)		{Rover.new(heading: 'S', starting_position: [0, 1])}
let(:auto_rover) 	{Rover.new(starting_position: [3, 3])}

context 'when instantiated' do

	it 'has a default starting position' do
		expect(rover.position).to eq [0, 0]
	end

	it 'has a default heading' do
		expect(rover.heading).to eq 'N' 
	end

	it 'can have its heading customised' do 
		expect(e_rover.heading).to eq 'E'
	end

end

context 'upon receiving input' do

	it 'can convert its heading into a numerical value for use in interpreting turn commands' do #need to refactor associated methods and may therefore break some tests
		expect(rover.current_heading_numerical).to eq 0
		rover.change_heading_to('E')
		expect(rover.current_heading_numerical).to eq 1
	end

	it 'can convert the heading index back into a heading' do #need to refactor associated methods and may therefore break some tests
		expect(rover.heading_alphabetical(0)).to eq 'N'
	end

	it 'can be given information regarding the plateau size and shape' do
		rover.accept_plateau_data("5 5")
		expect(rover.plateau_size).to eq [5, 5]
	end

	it 'can convert input commands into instructions for new headings' do
		input = 'R'
		expect(rover.new_heading_from(input)).to eq 'E'
		expect(e_rover.new_heading_from(input)).to eq 'S'

		input = 'L'
		expect(rover.new_heading_from(input)).to eq 'W'
	end

	it 'can change heading' do
		rover.change_heading_to('S')
		expect(rover.heading).to eq 'S'
	end

	it 'can move in the direction it is facing/heading' do
		
		expect(rover.heading).to eq 'N'
		rover.move
		expect(rover.position).to eq [0, 1]

		expect(s_rover.heading).to eq 'S'
		s_rover.move
		expect(s_rover.position).to eq [0, 0]

		expect(e_rover.heading).to eq 'E'
		e_rover.move
		expect(e_rover.position).to eq [1, 0]

	end

	it 'can accept a list of instructions and move automatically do a final destination' do
		input = 'MRM'
		rover.format_input(input)
		rover.run_instructions
		expect(rover.report).to eq "1 1 E"
	end

	it 'must not move off the edge of the plateau' do
		edge_rover = Rover.new(starting_position: [5, 5])
		edge_rover.accept_plateau_data("5 5")
		edge_rover.move
		expect(edge_rover.position).to eq [5, 5]
	end

end

context 'after moving to a new location' do

	it 'reports its new location' do
		rover.move
		expect(rover.report).to eq "0 1 N"
	end

end

context 'should have some degree of autonomy' do

	it 'and be able to reset its position to [0, 0] by moving to the southern border, then to the western border' do
		expect(auto_rover.distance_to_southern_edge).to eq 3
		auto_rover.move_to_south_western_corner
		expect(auto_rover.position).to eq [0, 0]
	end

	it 'and explore an entire plateau on command' do
		auto_rover.explore
		expect(auto_rover.positions_log.count).to eq auto_rover.total_plateau_area
	end

end

end