# require 'rails_helper'
#
# describe "User edits an existing category" do
#   scenario "a user can edit a category" do
#     category = Category.create!(title: "Web Developer")
#     visit edit_category_path(category)
#
#     fill_in "category[title]", with: "Elephant"
#     click_button "Submit"
#
#
#     expect(page).to have_content("Elephant")
#     expect(page).to_not have_content("Web Developer")
#   end
# end
