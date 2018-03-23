require "rails_helper"

describe "user creates a new article" do
  context "they link from the articles index" do
    it "they fill in a title and body" do
      visit "/articles"
      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)

      fill_in("Title", :with => "New Article")
      fill_in("Body", :with => "Here's all the new body content")
      click_on ("Create Article")
  
      expect(page).to have_content("New Article")
      expect(page).to have_content("Here's all the new body content")
    end
  end
end
