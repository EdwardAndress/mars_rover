require 'rover'

describe Rover do

let(:rover) {Rover.new}

context 'when instantiated' do

	it 'has a starting position' do
		expect(rover.position).to eq [0, 0]
	end

	it 'has a default orientation' do
		expect(rover.heading).to eq 'N' 
	end

end

context 'upon receiving input' do

	it 'can change heading' do
		rover.change_heading_to('S')
		expect(rover.heading).to eq 'S'
	end

end

end