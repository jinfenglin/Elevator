require_relative 'building'
class Simulation
	#register the building
	def initialize()
		@building=Building.new(3,1)
		@building.extend_floor()
		@building.add_person(Person.new(2,0))
		@building.add_person(Person.new(2,0))
		@building.add_person(Person.new(2,0))
		@building.add_person(Person.new(2,0))
		@building.add_person(Person.new(0,2))
		@building.add_person(Person.new(0,2))
		@building.add_person(Person.new(0,2))
		@building.add_person(Person.new(0,1))
		@building.add_person(Person.new(0,1))
	end

	def run(n)
		(1..n).each do |time|
			puts "time: #{time}"
			@building.clock_tick()
			@building.display()
		end
		
	end
end


sim=Simulation.new
sim.run(7)
