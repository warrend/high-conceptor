require 'rails_helper'

RSpec.describe Rating, type: :model do
  
  describe "factory test" do 
  	it "creates a factory rating" do 
  		expect(build(:rating)).to be_valid
  	end
  end

  describe "validations" do 
  	it "has a number between one and 100"

  	it "is invalid with anything other than a number"

  end

  describe "relationships" do 
  	it "has many loglines"
  end

  describe "instance methods" do 
  	it "average_rating gives the average rating for a logline"
  end
end
