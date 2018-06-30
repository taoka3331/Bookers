class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
     flash[:succes] ='Success'
     redirect_to @user
    else
     flash.now[:danger] ='error'
     render :new
    end
  end

  def index
  	@users = User.all
  	@user = current_user
  	@book_new =Book.new
  	@books = Book.all
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book_new =Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private 
    def user_params
    params.require(:user).permit(:name, :profile_image, :intoroduce)
    end
end
