require 'minitest/autorun'
require './building.rb'

describe 'Test_Building' do 

	it "test initial floors,each floor have correct id and empty people queue" do
		building= Building.new(3,1)
		assert_equal(building.floor_hash.length,3)
		assert_equal(building.elev_hash.length,1)
		
		building.floor_hash.each do |id,floor|
			assert_empty(floor.people)
		end

 				
	end

	it "test add person" do
		building=Building.new(3,1)
		person=Person.new(0,1)
		building.add_person(person)
		floor_zero=building.floor_hash[0]
		assert_equal(floor_zero.people.length,1)
	end

	it "test extend floor" do 
		building=Building.new(3,1)
		building.extend_floor()
		assert_equal(building.floor_num,4)
		assert_equal(building.floor_hash.length,4)
	end

	it "tesst extend elevator" do
		building=Building.new(3,1)
		building.extend_elevator()
		assert_equal(building.elev_num,2)
		assert_equal(building.elev_hash.length,2)
	end
end
