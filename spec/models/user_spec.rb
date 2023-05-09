require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.create(name: "John Wick", email: 'thebabayaga@gmail.com', password: 'yeah', password_confirmation: 'yeah')
    end

    it "should have valid attributes" do
      expect(@user). to be_valid
    end

    it "should have a valid name" do
      @user.name = "John Wick"
      @user.valid?
      expect(@user.errors.full_messages).to be_empty
    end

    it "should have a valid email" do
      @user.email = "thebabayaga@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to be_empty
    end

    it "should have a valid unique email" do
      @user2 = User.create(name: "Bruce Wayne", email: 'THEBABAYAGA@gmail.com', password:'ambatman', password_confirmation: 'ambatman')
      expect(@user2.email.downcase == @user.email).to be_truthy
    end

    it "should have a password that is inputted" do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a password that matches with password confirmation" do
      @user.password = "yeah"
      @user.password_confirmation = "justadog"
      expect(@user.password == @user.password_confirmation).to be_falsey
    end

    it "should have a minimum 4 characters password" do
      @user.password = "no"
      expect(@user.password.length > 4).to be_falsey
    end
  end
  
  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(name: "John Wick", email: 'thebabayaga@gmail.com', password: 'yeah', password_confirmation: 'yeah')
    end

    it "should log in if email and password is correct" do
      email = 'thebabayaga@gmail.com'
      password = 'yeah'

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user)
    end

    it "should not log in if the email is incorrect" do
      email = 'thebabayagan@gmail.com'
      password = 'yeah'

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to_not eq(@user)
    end

    it "should not log in if the password is incorrect" do
      email = 'thebabayaga@gmail.com'
      password = 'yeahh'

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to_not eq(@user)
    end

    it "should log in if user typed email with spaces" do
      email = '  thebabayaga@gmail.com  '
      password = 'yeah'

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user)
    end

    it "should log in if user typed email with different cases" do
      email = 'TheBabaYaga@gmail.com'
      password = 'yeah'

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user)
    end
  end
end
