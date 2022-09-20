require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

  it 'ensures that a user with all four fields set will save' do
    user = User.create(
      name: "Roger",
      email: "rogerpelican@pelican.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to (be_valid)
    end

    it 'ensures password and password_validation fields are matching' do
      user = User.create(
        name: "Roger",
        email: "roger@pelican.com",
        password: "password",
        password_confirmation: "pickles"
      )
      expect(user).to_not (be_valid)
    end

    it 'ensures password validation exists' do
      user = User.create(
        name: "Roger",
        email: "roger@pelican.com",
        password: "password",
        password_confirmation: nil
      )
      expect(user).to_not (be_valid)
    end

    it 'ensures email is unique and is not case-sensitive' do
      user1 = User.create(
        name: "Bob",
        email: "bobby@pelican.com",
        password: "password",
        password_confirmation: "password"
      )
      user2 = User.create(
        name: "Ashley",
        email: "BOBBY@pelican.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user2).to_not (be_valid) #not sure what the bug is here
    end

    it 'ensures required fields are present' do
      user = User.create(
        name: nil,
        email: nil,
        password: "password",
        password_confirmation: "pickles"
      )
      expect(user).to_not (be_valid)
    end

    it 'ensures user password meets minimum length requirement' do
      user = User.create(
        name: "Roger",
        email: "roger@pelican.com",
        password: "pa",
        password_confirmation: "pa"
      )
      expect(user).to_not (be_valid)
  end
end

describe '.authenticate_with_credentials' do
  it 'ensures user is authenticated with credentials' do
    user = User.create(
      name: "Roger",
      email: "roger@pelican.com",
      password: "pickles",
      password_confirmation: "pickles"
    )
  authenticate = User.authenticate_with_credentials(user.email, user.password)
  expect(authenticate).to_not be_valid
end
end
end


