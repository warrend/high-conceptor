require "rails_helper"

RSpec.describe User, type: :model do

  it "has a valid user factory with name, email, and password" do 
    expect(build(:user)).to be_valid
  end

  describe "validations" do 

    it "is not valid without a name" do
      expect(build(:user, name: nil)).to_not be_valid
    end

    it "is not valid without an email" do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it "requires a unique email" do 
      create(:user, email: 'lebron@cleveland.com')
      user = build(:user, email: 'lebron@cleveland.com')
      expect(user).to_not be_valid
    end

    it "has a valid email address" do 
      expect(build(:user, email: "dan.gmail.com")).to_not be_valid
    end

    it "is not valid without a password" do 
      expect(build(:user, password: nil)).to_not be_valid
    end

    it "has a password length of eight or longer" do 
      expect(build(:user, password: "1234567")).to_not be_valid
    end

    it "has an encrypted password" do 
      user = build(:user)
      user.save
      expect(user.password_digest).to be_truthy
      expect(user.password_digest).to_not eq(user.password)
    end

  end

  describe "relationships" do 
    it "validates a logline factory" do 
      expect(build(:logline)).to be_valid
    end

    it "has many loglines" do 
      user = create(:user)
      logline1 = build(:logline)
      logline2 = build(:logline)

      user.loglines << logline1 
      user.loglines << logline2
      user.save

      expect(user.loglines.count).to eq(2)
      expect(user.loglines.last.user).to eq(user) 
    end

    it "has many ratings"
      
    end

  end

end
