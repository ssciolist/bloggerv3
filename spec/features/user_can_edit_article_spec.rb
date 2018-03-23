require "rails_helper"

describe "user edits an article" do
  context "they edit from a show article page" do
    it "they click an edit button" do
      article_1 = Article.create!(title: "Denver Post is dying", body: "Because of greed")
      article_2 = Article.create!(title: "Journalism is dying", body: "It's failing to adapt")

      visit "/articles/#{article_1.id}"
      click_link "Edit this article"

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in("Title", :with => "New Article")
      fill_in("Body", :with => "Here's all the new body content")
      click_on ("Update Article")

      expect(current_path).to eq(articles_path)
      expect(page).to have_content("New Article")
    end
  end
end
