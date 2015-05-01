require 'minitest/autorun'
require './floor.rb'

describe "test floor" do
	it "test get elevator" do
		floor=Floor.new(0,Building.new(3,1))
		elevators=floor.get_elevator()
		assert_equal(elevators.length,1)

	end

	it "test up or down" do 
		floor=Floor.new(0,Building.new(3,1))
		assert_equal(floor.up_or_down(0,1),"UPWARD")
		assert_equal(floor.up_or_down(1,0),"DOWNWARD")

	end

	it "test space" do 
		building=Building.new(3,1)
		floor=building.floor_hash[0]
		assert_equal(floor.space,50)
		person=Person.new(0,2)
		building.add_person(person)
		assert_equal(floor.space,49)

		people=[]
		(0..60).each do |count|
			people.push(Person.new(0,2))
		end
		building.add_people(people)
		assert_equal(floor.space,0)

	end

	it "test initial_button" do
		floor=Floor.new(0,Building.new(3,1))
		floor.call_buttons.each do |id,pair|
			assert_equal(pair[0],false)
			assert_equal(pair[1],false)
		end
	end

	it "test set call" do
		floor=Floor.new(0,Building.new(3,1))
		floor.set_call(0,"UPWARD")
		assert_equal(floor.call_buttons[0][1],true)
	end


	it "test send request" do 
		building= Building.new(3,1)
		floor=Floor.new(0,building)
		floor.send_request(0)
		elevators=building.elev_hash()
		elevator=elevators[0]
		assert_equal(elevator.request_calls[0],1)
	end

	it "test load" do
		building= Building.new(3,1)
		floor=building.floor_hash[0]
		elevator=building.elev_hash[0]
		(1..20).each do |count|
			person=Person.new(0,2)
			building.add_person(person)
			floor.load(elevator)
		end
		assert_equal(floor.people.length,10)
		assert_equal(elevator.people.length,10)
	end

	
end


