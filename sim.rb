require_relative 'building'
class Simulation
	#register the building
	def initialize()
		@building=Building.new(3,1)
		@building.add_people(self.generate_people(11,Person.new(2,0)))
		@building.add_people(self.generate_people(3,Person.new(0,2)))
		@building.add_people(self.generate_people(2,Person.new(0,1)))
	end

	def generate_people(number,person_template)
		current_floor=person_template.current_floor
		target_floor=person_template.target_floor
		queue=[]
		(1..number).each do |count|
			queue.push(Person.new(current_floor,target_floor))
		end
		return queue
	end

	def run(n)
		(1..n).each do |time|
			puts "time: #{time}"
			@building.clock_tick()
			@building.display()
			puts ""

		end
		
	end
end


sim=Simulation.new
sim.run(10)
