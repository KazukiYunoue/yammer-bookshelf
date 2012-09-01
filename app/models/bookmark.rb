class Bookmark < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :book, :counter_cache => true

  attr_accessible :user_id, :book_id
end
