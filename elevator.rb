class Elevator
	attr_accessor :status #moving upward, downward, or stationary
	attr_accessor :current_floor
	def initialize(elevator_id,building)
		@building=building
		@maximal_num=10
		@id=elevator_id
		@current_floor=0
		@status='STOP'
		@people=[]
		@request_calls={}
	end

	def load(person)
		@people.push(person)
	end
	def space()
		@maximal_num-@people.length()
	end
	def add_request(floor_id)
		@request_calls[floor_id]=1
	end
	def clock_tick()
		#people on board make request call
		@people.each do |person|
			dest=person.target_floor
			if dest==current_floor
				@people.delete(person)
			else
				self.add_request(dest)
			end
		end
		#update the elevator's status, if the request on elevator queue is mostly going upward, then go upward
		#else go downward, if no request, then stay
		@request_calls.each do |floor_id,value|
			if floor_id > @current_floor
				@status="UPWARD"
			elsif floor_id <@current_floor
				@status="DOWNWARD"
			else
				@status="STOP"
				@request_calls.delete(floor_id)
			end
		end
		#let the elevator move
		if @status == 'UPWARD'
			@current_floor+=1
		elsif @status == "DOWNWARD"
			@current_floor-=1			
		end
			
	end
	def get_floor()
		floors=@building.floor_hash
	end
	
	def display()
		puts "-------elevator #{@id}---------"
		puts "current floor:#{@current_floor}"
		puts "status:#{@status}"
		puts "request queue: #{@request_calls}"
		puts "peopel: #{@people}"
	end
end
