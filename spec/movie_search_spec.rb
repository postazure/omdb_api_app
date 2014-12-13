require 'rails_helper'

feature "MovieSeach" do
  feature "#form" do
    scenario "form is root_path" do
      visit root_path

      expect(page.current_path).to eq(root_path)
    end

    scenario "has a field and submit" do
      visit root_path

      expect(page).to have_field("movie-title-field")
      expect(page).to have_button("movie-title-submit")
    end

    scenario "submit form" do
      visit root_path
      fill_in "movie-title-field", with: "Star Wars"
      click_on "movie-title-submit"

      expect(page.current_path).to eq(results_path)
    end
  end

  # feature "#results" do
  #   scenario "display reults" do
  #     visit root_path
  #
  #
  #   end
  # end
end
