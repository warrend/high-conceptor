require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid user factory with name, email, and password" do 
    expect(build(:user)).to be_valid
  end

  it "is not valid without a name" do
    expect(build(:user, name: nil)).to_not be_valid
  end

  it "is not valid without an email" do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it "is not valid without a password" do 
    expect(build(:user, password: nil)).to_not be_valid
  end

  it "has a valid email address" do 
    expect(build(:user, email: "dan.gmail.com")).to_not be_valid
  end

  it "has a password length of eight or longer" do 
    expect(build(:user, password: "1234567")).to_not be_valid
  end

end
