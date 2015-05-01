require 'minitest/autorun'
require './elevator'

describe "test" do
	it "test load and space" do
		elevator=Elevator.new(0,Building.new(3,1))
		assert_equal(elevator.space,10)
		person=Person.new(0,2)
		elevator.load(person)
		assert_equal(elevator.people.length,1)
		assert_equal(elevator.space,9)
	end


	it "test direction_decision" do
		elevator=Elevator.new(0,Building.new(7,1))
		elevator.current_floor=3
		assert_equal(elevator.direction_decision(),"STOP")
		elevator.add_request(0)
		elevator.add_request(1)
		assert_equal(elevator.direction_decision(),"DOWNWARD")
		elevator.add_request(4)
		assert_equal(elevator.direction_decision(),"DOWNWARD")
		elevator.add_request(5)
		elevator.add_request(6)
		assert_equal(elevator.direction_decision(),"UPWARD")
	end

	it "test move" do
		elevator=Elevator.new(0,Building.new(3,1))
		elevator.status="UPWARD"
		elevator.move()
		assert_equal(elevator.current_floor,1)
		elevator.status="DOWNWARD"
		elevator.move()
		assert_equal(elevator.current_floor,0)
		elevator.status="STOP"
		assert_equal(elevator.current_floor,0)
		elevator.status="DOWNWARD"
		elevator.move()
		assert_equal(elevator.current_floor,0)
	end

	it "test load off" do
		elevator=Elevator.new(0,Building.new(3,1))
		person=Person.new(0,2)
		elevator.load(person)
		elevator.load_off()
		assert_equal(elevator.people.length,1)
		elevator.current_floor=2
		elevator.load_off()
		assert_equal(elevator.people.length,0)

	end


end
