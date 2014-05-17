require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Home Page" do 
  let(:user) { FactoryGirl.create(:user) }

  context "user not logged in" do
    it "redirects to the sign in page" do
      visit root_path
      current_path.should eq('/users/sign_in')
    end
  end

  context "user is logged in" do
    before(:each) do
      login_as(user, scope: :user)
      visit root_path
    end

    it "displays the upload form" do
      page.should have_css('form#upload-form')
      page.should have_button('submit')
    end

    it "displays an error when submitting an empty form" do
      click_button('submit')
      page.should have_content("A file is required. Please select a file.")
    end

    it "allows the user to upload a file" do
      attach_file('file', Rails.root.join('spec', 'factories', 'example_input.tab'))
      click_button('submit')
      page.should have_content("File submitted.")
      page.should have_content("Gross revenue: $95.00.")
    end
  end
end