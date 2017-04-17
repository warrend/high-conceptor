require "rails_helper"

describe User do
  it 'is valid with a first name, email, and password' do
    user = User.new(name: 'LeBron', email: 'lebron@cleveland.com', password: "dunk1234")

    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(email: 'lebron@cleveland.com', password: "dunk1234")

    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.new(name: 'LeBron', password: "12345")

    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    user = User.create(name: 'LeBron', email: 'lebron@cleveland.com', password: "12345")
    user2 = User.create(name: 'Kyrie', email: 'lebron@cleveland.com', password: "12345")

    expect(user2).to_not be_valid
  end

  describe 'associations' do
    it 'has many loglines' do
      user = User.create(name: 'LeBron', email: 'lebron@cleveland.com', password: "12345")
      logline = Logline.create
      logline2 = Logline.create

      user.loglines << logline
      user.loglines << logline2

      expect(user.loglines.size).to eq(2)
    end

    it 'has many ratings' do
      user = User.create(name: 'LeBron', email: 'lebron@cleveland.com', password: "12345")
      rating = Rating.create
      rating2 = Rating.create

      user.ratings << rating
      user.ratings << rating2

      expect(user.ratings.size).to eq(2)
    end
  end

end
