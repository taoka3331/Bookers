class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  
  def top
  end

  def about
  end

  def index
  	@books =Book.all
    @book_new =Book.new
    @user = current_user

  end


  def show
  	@book = Book.find(params[:id])
    @book_new =Book.new
    @user = @book.user
  end

  def new
  	@books =Book.all
  	@book =Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id =current_user.id
  if @book.save
    flash[:notice] ='success!'
    redirect_to book_path(@book.id)
  else
    flash.now[:notice]='danger'
    render user_path
  end
  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user.id == current_user.id
    else
     redirect_to user_path(current_user)
    end
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)
  end

  def destroy
  	book =Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end

