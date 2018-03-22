require "rails_helper"

describe "user sees one article" do
  context "they visit an articles/:id page" do
    it "shows information about one article" do
      article_1 = Article.create!(title: "Liqour tricks", body: "How whiskey can fix it")

      visit "/articles"
      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
