class BooksController < ApplicationController

  def top
  end
  
  def index
  	@books =Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@books =Book.all
  	@book =Book.new
  end

  def create
  	book = Book.new(book_params)
  	@book =Book.new(body: params[:body])
  	if book.save
  	flash[:notice] ="successfully"
  	redirect_to book_path(book.id)
    else
      render new_book_path
  end
  end

  def edit
  	@book =Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)
  end

  def destroy
  	book =Book.find(params[:id])
  	book.destroy
  	redirect_to new_book_path
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

