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

  feature "#results" do
    scenario "display titles as links" do
      visit root_path
      fill_in "movie-title-field", with: "Star Wars"
      click_on "movie-title-submit"

      expect(page).to have_link("Star Wars")
      expect(page).to have_link("Star Wars: Episode I - The Phantom Menace")
      expect(page).to have_link("Star Wars: Episode II - Attack of the Clones")
    end
    scenario "display years" do
      visit root_path
      fill_in "movie-title-field", with: "Star Wars"
      click_on "movie-title-submit"

      expect(page).to have_link("Star Wars")
      expect(page).to have_content("1977")
    end
  end

  feature "#title" do
    scenario "navigate to title show page" do
      visit root_path
      fill_in "movie-title-field", with: "Star Wars"
      click_on "movie-title-submit"
      click_on "Star Wars: Episode II - Attack of the Clones"

      expect(page.current_path).to eq(title_path("tt0121765"))
    end
  end
end
