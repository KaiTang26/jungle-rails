require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_uniqueness_of(:email).case_insensitive}
    it {is_expected.to validate_length_of(:password).is_at_least(8)}
  end

  describe ".authenticate_with_credentials" do
    it "shoule be true" do
      @user = User.create({
        first_name: "Kai",
        last_name: "Tang",
        email:"example@domain.com",
        password:"11111111",
        password_confirmation:"11111111"
      })
      expect(User.authenticate_with_credentials(" example@domain.com","11111111")).to be true
    end

    it "shoule be true" do
      @user = User.create({
        first_name: "Kai",
        last_name: "Tang",
        email:"kaitang@gmail.com",
        password:"11111111",
        password_confirmation:"11111111"
      })
      expect(User.authenticate_with_credentials("kaitang@gmail.com","111")).to be nil
    end

    
  end
end
