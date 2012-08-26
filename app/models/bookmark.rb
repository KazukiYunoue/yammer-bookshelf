class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  attr_accessible :user_id, :book_id
end
