require 'rails_helper'

RSpec.describe Rating, type: :model do
  
  describe "factory test" do 
  	it "creates a factory rating" do 
  		expect(build(:rating)).to be_valid
  	end
  end

  describe "validations" do 
  	it "has a number between one and 100" do 
  		expect(build(:rating, rating: 100)).to be_valid
  	end

  	it "is invalid with anything other than a number" do 
  		expect(build(:rating, rating: "Ten")).to_not be_valid
  	end

  end

  describe "relationships" do 
  	it "has many loglines" do

  	end
  end

  describe "instance methods" do 
  	it "#average_rating gives the average rating for a logline"
  end
end
