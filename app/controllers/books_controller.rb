class BooksController < ApplicationController
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

  def create
    @book = Book.new(book_params)
    if @book.save
      flash.now[:notice] = t('flash.successful')
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = t('flash.error')
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.now[:notice] = t('flash.successful')
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = t('flash.error')
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash.now[:notice] = t('flash.successful')
    else
      flash.now[:alert] = t('flash.error')
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
