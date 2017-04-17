require 'rails_helper'

describe Logline do

	it 'is invalid without content' do
		logline = Logline.create

		expect(logline).to_not be_valid
	end

	describe 'associations' do 
		let(:logline) {Logline.create(content: "A mysterious man finds...")}
		let(:category) {Category.create(name: "film")}
		let(:category2) {Category.create(name: "thriller")}
		let(:user) {User.new(name: "LeBron", email: "lebron@cleveland.com", password: "12345678")}
		let(:rating) {Rating.create}
		let(:rating2) {Rating.create}

		it 'belongs to a user' do
			logline.user = user 

			expect(logline.user).to eq(user)
		end

		it 'has many ratings' do
			logline.ratings << rating 
			logline.ratings << rating2 

			expect(logline.ratings.count).to eq(2)
		end

		it 'has many categories' do
			logline.categories << category 
			logline.categories << category2 

			expect(logline.categories.count).to eq(2)
		end

	end
 
  # describe 'associations' do
  #   let(:cart) {Cart.create}
  #   let(:item) {Item.create(name: 'Pencil', inventory: 20, price: 2)}
  #   let(:item2) {Item.create(name: 'Pen', inventory: 30, price: 3)}
  #   let(:user) {User.new(first_name: 'Cernan', last_name: 'Bernardo', email: 'cernan@flatironschool.com')}

  #   it 'belongs to a user' do
  #     cart.user = user

  #     expect(cart.user).to eq(user)
  #   end

  #   it 'has many items' do
  #     cart.items << item
  #     cart.items << item2

  #     expect(cart.items.size).to eq(2)
  #   end
end
