require 'test_helper'

Rspec.describe User, :type => :model do
  it "test user creation" do
    user_test = User.create!(name: "kratos", email: "kratos@sparta", password: "123", lates: "url")

    expect(user_test).to_not be_nil
  end
end
