require 'minitest/autorun'
require './building.rb'

describe 'Test_Building' do 

	it "test initial floors,each floor have correct id and empty people queue" do
		building= Building.new(3,1)
		assert_equal(building.floor_hash.length,3)
		assert_equal(building.elev_hash.length,1)
		
		building.floor_hash.each do |id,floor|
			puts id
			assert_empty(floor.people)
		end

 				
	end

	it "test add person" do
	end

	it "test add people" do 
	end	

	it "test initial" do 
	end
end
