require "rails_helper"

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create!(title: "Denver Post is dying", body: "Because of greed")
      article_2 = Article.create!(title: "Journalism is dying", body: "It's failing to adapt")

      visit "/articles"

      expect(page).to have_link(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_link(article_2.title)
      expect(page).to have_content(article_2.body)
    end
  end
end
