require 'rover'

describe Rover do

let(:rover) 	{Rover.new}					#rover for testing
let(:e_rover) 	{Rover.new(heading: 'E')} 	#new rover heading East

context 'when instantiated' do

	it 'has a default starting position' do
		expect(rover.position).to eq [0, 0]
	end

	it 'has a default orientation' do
		expect(rover.heading).to eq 'N' 
	end

	it 'can have an orientation other than the default' do 
		expect(e_rover.heading).to eq 'E'
	end

end

context 'upon receiving input' do

	it 'can change heading' do
		rover.change_heading_to('S')
		expect(rover.heading).to eq 'S'
	end

	it 'can move in the direction it is facing/heading' do 
		rover.move
		expect(rover.position).to eq [0, 1]
		e_rover.move
		expect(e_rover.position).to eq [1, 0]
	end

end

end