require_relative 'floor'
require_relative 'elevator'
require_relative 'person'
class Building
	attr_accessor :elev_hash
	attr_accessor :floor_hash
	attr_accessor :elev_num
	attr_accessor :floor_num
	def initialize(floor_num,elev_num)
		@floor_num=floor_num
		@elev_num=elev_num
		@floor_hash={}
		@elev_hash={}

		initial_floors()
		initial_elev()
	end

	#abstraction for initializing floor and elveator
	def init_hash(num,class_name,hash)
		(0..num-1).each do |id|
			ins=class_name.new(id,self)
			hash[id]=ins
		end

	end

	#build up a brand new building! Roll up your sleeve and make your hand dirty
	def initial_floors()
		self.init_hash(@floor_num,Floor,@floor_hash)		
	end

	#build up a new elevator
	def initial_elev()
		self.init_hash(@elev_num,Elevator,@elev_hash)		
	end
	#expecting a list of person object, distribute person the floor
	def initial_peopel(people)
		people.each do |person|
			self.add_person(person)
		end
	end

	#add one more floor in the current building,ites floor_id depends on how many floors
	#we already have
	def extend_floor()
		@floor_num+=1
		floor=Floor.new(@floor_num-1)
		@floor_hash[floor_num-1]=floor
	end
	

	# Add a single person to a floor, which is decided by the information inside
	# the person instance
	def add_person(person)
		current_floor = @floor_hash[person.current_floor]
		current_floor.add_person(person)
	end


	def clock_tick()
		@floor_hash.each do |id,floor|
			floor.clock_tick()
		end 
		@elev_hash.each do |id,elevator|
			elevator.clock_tick()
		end 
	end
	
	def display()
		puts "===================Building================"
		@floor_hash.each do |id,floor|			
			floor.display()
		end
		@elev_hash.each do |id,elevator|
			elevator.display()
		end
		puts "==========================================="
	end

end
