require 'rails_helper'

describe 'As a user when I visit /' do
  it "And I fill in a search box with '80202' and click 'search'" do
    VCR.use_cassette "services/api_response" do
      visit '/'
      fill_in 'zip', with: "80202"
      click_on 'search'
      expect(current_path).to eq('/search')
      expect(page).to have_content('16 Total Stores')
      expect(page).to have_selector('.store', count: 10)
      within(".store", match: :first) do
        expect(page).to have_content('Name:')
        expect(page).to have_content('City:')
        expect(page).to have_content('Distance:')
        expect(page).to have_content('Phone:')
        expect(page).to have_content('Store Type:')
      end
    end
  end
  it "User uses invalid zip and gets a flash to go elswhere" do
    visit '/'
    fill_in 'zip', with: "1"
    click_on 'search'
    expect(current_path).to eq('/')
    expect(page).to have_content('Please use a valid zip')
  end
end
