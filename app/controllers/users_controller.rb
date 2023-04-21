class UsersController < ApplicationController
  
  
  def create
    @user = User.new(user_params)
    @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to users_path(@user.id)
  end
  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books 
  end

  def edit
    @user = User.find(params[:id])
  end
end
