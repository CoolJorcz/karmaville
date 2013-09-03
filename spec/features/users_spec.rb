require 'spec_helper'

feature "pagination" do

  include GenerateUsers
  
  before :each do
    generate_users 
  end
  
  scenario "clicking page 1" do 
    visit root_url
    save_and_open_page
    click_link "Next"
    expect(page).to have_link "Next"
  end

end
