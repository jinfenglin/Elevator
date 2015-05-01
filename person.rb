class Person
	attr_accessor :target_floor
	attr_accessor :current_floor
	def initialize(current_floor,target_floor)
		@current_floor=current_floor
		@target_floor=target_floor
	end
end
