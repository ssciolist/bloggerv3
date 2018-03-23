require "rails_helper"

describe "user deletes an article" do
  context "they link from an individual article" do
    it "they click a delete button" do
      article_1 = Article.create!(title: "Denver Post is dying", body: "Because of greed")
      article_2 = Article.create!(title: "Journalism is dying", body: "It's failing to adapt")

      visit "/articles/#{article_1.id}"
      click_link "Delete this article"

      expect(current_path).to eq(articles_path)
      expect(page).to_not have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
