class Book < ActiveRecord::Base
  paginates_per 8

  attr_accessible :asin

  attr_accessor :terms

  validates :asin,
    :presence => true

  has_many :bookmarks
  has_many :users, :through => :bookmarks

  def title
    Amazon::Book.find_by_asin(self.asin).first.get("ItemAttributes/Title")
  end

  def image_url
    Amazon::Book.find_by_asin(self.asin).first.get("ImageSets/ImageSet/LargeImage/URL")
  end

  def author
    Amazon::Book.find_by_asin(self.asin).first.get("ItemAttributes/Author")
  end

  def label
    Amazon::Book.find_by_asin(self.asin).first.get("ItemAttributes/Label")
  end

  def formatted_price
    Amazon::Book.find_by_asin(self.asin).first.get("ItemAttributes/ListPrice/FormattedPrice")
  end

  def detail_page_url
    Amazon::Book.find_by_asin(self.asin).first.get("DetailPageURL")
  end

  def self.find_by_terms_on_amazon(terms, country="jp", page=1)
    amazon_books_ASINs = []

    page ||= 1

    amazon_books = Amazon::Book.find_by_terms(terms, country, page.to_i)
    amazon_books.each do |amazon_book|
      unless Book.find_by_asin(amazon_book.get("ASIN"))
        Book.create(:asin => amazon_book.get("ASIN"))
      end

      amazon_books_ASINs << amazon_book.get("ASIN")
    end

    return amazon_books_ASINs
  end
end
