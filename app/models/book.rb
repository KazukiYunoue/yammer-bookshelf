class Book < ActiveRecord::Base
  attr_accessible :isbn

  validates :isbn,
    :presence => true

  has_many :bookmarks
  has_many :users, :through => :bookmarks
end
