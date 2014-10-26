require 'rover'

describe Rover do

let(:rover) 	{Rover.new}					#rover for testing
let(:e_rover) 	{Rover.new(heading: 'E')} 	#new rover heading East
let(:s_rover)	{Rover.new(heading: 'S', starting_position: [0, 1])}

context 'when instantiated' do

	it 'has a default starting position' do
		expect(rover.position).to eq [0, 0]
	end

	it 'has a default orientation' do
		expect(rover.heading).to eq 'N' 
	end

	it 'can have its orientation customised' do 
		expect(e_rover.heading).to eq 'E'
	end

	it 'can convert its heading into a numerical value for use in interpreting turn commands' do
		expect(rover.heading_to_index).to eq 0
		rover.change_heading_to('E')
		expect(rover.heading_to_index).to eq 1
	end

	it 'can convert the heading index back into a heading' do
		expect(rover.index_to_heading(0)).to eq 'N'
	end

end

context 'upon receiving input' do

	it 'can convert input commands into instructions for new headings' do
		input = 'R'
		expect(rover.convert(input)).to eq 'E'
		expect(e_rover.convert(input)).to eq 'S'

		input = 'L'
		expect(rover.convert(input)).to eq 'W'
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

end

context 'after moving to a new location' do

	it 'reports its new location' do
		rover.move
		expect(rover.report).to eq "0 1 N"
	end

end

end