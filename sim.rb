require_relative 'building'
class Simulation
	#register the building
	def initialize()
		@building=Building.new(3,1)
		@building.add_person(Person.new(1,2))
	end

	def run(n)
		@building.display()
		(1..n).each do |time|
			puts "time: #{time}"
			@building.clock_tick()
			@building.display()
		end
		
	end
end


sim=Simulation.new
sim.run(6)
