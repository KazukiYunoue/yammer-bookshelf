class BookmarksController < ApplicationController
  # POST /bookmarks
  # POST /bookmarks.xml
  def create
    @bookmark = Bookmark.new(:user_id => current_user.id, :book_id => params[:book_id])

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to(:back, :notice => 'Bookmark was successfully created.') }
      else
        format.html { redirect_to :back }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.xml
  def destroy
    @bookmark = Bookmark.find_by_user_id_and_book_id(current_user.id, params[:book_id])
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to(:back, :notice => "Bookmark was successfully deleted.") }
      format.xml  { head :ok }
    end
  end
end
