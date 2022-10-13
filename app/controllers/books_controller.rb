class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="Successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice]="Successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice]="Successfully deleted."
    redirect_to books_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end