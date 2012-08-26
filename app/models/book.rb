class Book < ActiveRecord::Base
  attr_accessible :asin

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
end
