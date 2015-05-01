class Floor
	attr_accessor :people
	attr_accessor :call_buttons
	def initialize(floor_id,building)#building is the overall background 
		@building=building
		@id=floor_id
		@people=[]
		@call_buttons={} #key is the elvator id, value is a pair of boolean, initial them all to false
		self.initial_button()
	end

	#click on the call button on that floor for a certain elevator
	def set_call(elev_id,direction)
		button=@call_buttons[elev_id]
		if direction=="DOWNWARD"
			button[0]=true
		elsif direction=="UPWARD"
			button[1]=true
		end
	
	end

	def get_elevator()
		@building.elev_hash
	end

	#set all button to be unpressed
	def initial_button()
		elev_num=@building.elev_num
		(0..elev_num-1).each do |elev_id|
			@call_buttons[elev_id]=[false,false]
		end
				
	end

	def send_request(elevator_id)
		elevators=self.get_elevator()
		elevator=elevators[elevator_id]
		elevator.add_request(@id)
	end

	#add one person to people array
	def add_person(person)
		people.push(person)
	end

	def display()
		puts "-------floor #{@id}---------"
		puts "people in queue #{@people.length}"
		puts "call button #{@call_buttons}"
	end
	def up_or_down(current_floor,target_floor)
		if current_floor>target_floor
			return 'DOWNWARD'
		else 
			return 'UPWARD'
		end
	end
	def load(elevator)
		space=elevator.space()
		(1..space).each do 
			if not @people.empty?()
				person=@people.pop()
				elevator.load(person)
			end
		end
	end

	def clock_tick()
		#load people to elevator
		elevators=self.get_elevator()
		elevators.each do |id,elevator|
			if elevator.current_floor ==@id
				self.load(elevator)
			end
		end
		#set calls by people
		elevator_num=@building.elev_num
		people.each do |person|
			direction=up_or_down(@id,person.target_floor)
			(0..elevator_num-1).each do |elevator_id| # yeah, I will push every button, because I am eager!
				self.set_call(elevator_id,direction)
				self.send_request(elevator_id)
			end			
		end
		
	end

end
