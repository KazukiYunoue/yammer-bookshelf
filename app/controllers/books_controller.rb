class BooksController < ApplicationController
  before_filter :book, :only => ["index","show"]

  # GET /books
  # GET /books.xml
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @books = []
      @user.bookmarks.order("created_at desc").each do |bookmark|
        @books << Book.find(bookmark.book_id)
      end
    elsif params[:terms]
      @books = Book.find_by_terms_on_amazon(params[:terms])
    else
      @books = Book.where("bookmarks_count != 0").order("bookmarks_count desc")
    end

    @current_user_books = current_user.books

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])
    @users = []
    @book.bookmarks.order("created_at desc").each do |bookmark|
      @users << User.find(bookmark.user_id)
    end

    @current_user_books = current_user.books

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    bookmark = Bookmark.new(:user_id => current_user.id)

    ActiveRecord::Base.transaction do
      @book.save
      bookmark.book_id = @book.id
      bookmark.save
    end

    respond_to do |format|
      format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
      format.xml  { render :xml => @book, :status => :created, :location => @book }
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = UserBook.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = UserBook.where(:user_id => current_user.id).find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  private

  def book
    @book = Book.new
  end
end
