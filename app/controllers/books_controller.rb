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
      flash[:notice] = '登録成功しました'
      redirect_to books_path
    else
      flash[:alert] = '登録失敗しました'
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = '削除成功しました'
      # render :show
    else
      flash[:alert] = '削除失敗しました'
      # render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
