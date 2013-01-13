class UsersController < ApplicationController
  
  # GET /books/:book_id/users
  # GET /books/:book_id/users.json
  def index
    book = Book.new(:book_id)
    @users = book.users.select [:id, :email, :full_name, :image, :location, :nickname, :urls, :bookmarks_count]

    respond_to do |format|
      format.json  { render :json => @users }
    end
  end
end
