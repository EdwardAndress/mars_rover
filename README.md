###Mars Rover: OOD Tech Test
-----------------------------------------
 
####Set it up:
```sh
$ git clone https://github.com/EdwardAndress/mars_rover.git
```

####Test it:
```sh
$ cd mars_rover
$ rspec
```

####Play with it:
```sh
$ cd mars_rover/lib
$ irb
$ require './rover.rb'
```
	* By default Rover.new will instantiate a rover at position [0, 0], heading North, on a plateau of [5, 5]
	* You can change this by specifying (starting_position: number), (heading: 'N/S/E/W') or (plateau_size: [x, y]) at instantiation
 	* INSTANCE.format_input('COMMANDS') takes input as a string and converts it to an array
 		- input must be either:
 			- 'M' for move forward
 			- 'L' for turn left
 			- 'R' for turn right
	* INSTANCE.run_instructions iterates through the formatted input array (@instructions)
	* INSTANCE.report gives a report of the current location and heading
	* INSTANCE.explore tells the rover to automatically explore the entire plateau



