class Admin::BooksController < Admin::ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  authorize_actions_for Book, :except => :index

  # GET /admin/books
  def index
    @books = Book.all
  end

  # GET /admin/books/1
  def show
  end

  # GET /admin/books/new
  def new
    @book = Book.new
  end

  # GET /admin/books/1/edit
  def edit
  end

  # POST /admin/books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to main_app.admin_books_url, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/books/1
  def update
    if @book.update(book_params)
      redirect_to main_app.admin_books_url, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/books/1
  def destroy
    @book.destroy
    redirect_to main_app.admin_books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit([:title, :author])
    end
end
