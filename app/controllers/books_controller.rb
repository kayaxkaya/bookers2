class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
  end

  def edit
    @user = find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end