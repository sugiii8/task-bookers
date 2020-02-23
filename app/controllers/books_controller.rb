class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = t('flash.successful')
      redirect_to book_path(book.id)
    else
      flash[:alert] = t('flash.error')
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = t('flash.successful')
    else
      flash[:alert] = t('flash.error')
    end
    redirect_to books_path
  end

  def top

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
