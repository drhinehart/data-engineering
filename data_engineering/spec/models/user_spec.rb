require 'spec_helper'

describe User do
  describe "creation" do
    context "valid attributes" do
      it "has a valid factory" do
        user = FactoryGirl.build(:user)
        user.should be_valid
      end
    end

    context "invalid attributes" do
      it "is not valid without an email address" do
        user = FactoryGirl.build(:user, email: "")
        user.should_not be_valid
      end

      it "is not valid without a password" do
        user = FactoryGirl.build(:user, password: "")
        user.should_not be_valid
      end

      it "is not valid if password confirmation doesnt match password" do
        user = FactoryGirl.build(:user, password_confirmation: "taco")
        user.should_not be_valid
      end
    end
  end
end
