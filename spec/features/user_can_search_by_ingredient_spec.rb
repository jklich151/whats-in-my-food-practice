require 'rails_helper'

describe "As a user" do
  it "can search by ingredient" do
    visit "/"

    fill_in :q, with: "sweet potatoes"

    click_on "Search"

    expect(current_path).to eq("/foods")

    expect(page).to have_content("50 Results")

    within (first(".ingredient_info")) do
      expect(page).to have_css(".gtinUpc")
      expect(page).to have_css(".description")
      expect(page).to have_css(".brandOwner")
      expect(page).to have_css(".ingredients")
    end
  end
end
# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
