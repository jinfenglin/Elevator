class Elevator
	attr_accessor :status #moving upward, downward, or stationary
	attr_accessor :current_floor
	attr_accessor :request_calls
	attr_accessor :people
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
	def direction_decision()
		up_count=0
		down_count=0
		@request_calls.each do |floor_id, value|
			if floor_id > @current_floor
				up_count+=1
			elsif floor_id <@current_floor
				down_count+=1
			else
				@request_calls.delete(floor_id)
			end
		end
		
		if up_count+down_count==0
			@status="STOP"
		elsif up_count>down_count
			@status="UPWARD"
		else 
			@status="DOWNWARD"
		end
	end

	def move()
		#let the elevator move
		if @status == 'UPWARD' and @current_floor+1<@building.floor_num
			@current_floor+=1
		elsif @status == "DOWNWARD"and @current_floor-1>=0
			@current_floor-=1			
		end
	end

	def load_off()
		temp_people=[]
		(0..@people.length-1).each  do |count|

			temp_person=@people.shift()
			dest=temp_person.target_floor()	
			if dest != @current_floor
				temp_people.push(temp_person)
				self.add_request(dest)
			end
		end
		@people=temp_people

	end

	def clock_tick()	
		#update the elevator's status, if the request on elevator queue is mostly going upward, then go upward
		#else go downward, if no request, then stay
		self.move()
		self.load_off()		
		self.direction_decision()
	end
	
	def get_floor()
		floors=@building.floor_hash
	end
	
	def display()
		puts "-------elevator #{@id}---------"
		puts "current floor:#{@current_floor}"
		puts "status:#{@status}"
		puts "request queue: #{@request_calls}"
		puts "peopel: #{@people.length}"
	end
end
