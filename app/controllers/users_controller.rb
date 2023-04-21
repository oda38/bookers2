class UsersController < ApplicationController
  
   def index
    @user = User.new
    @users = User.all
  end
  
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
  
  
  def update
    @user = User.find(params[:id])
     if current_user == @user
      @user.update(user_params)
      flash[:notice] = "You have updated user successfully." 
      redirect_to  user_path(@user.id)
     else
      render :edit
     end
  end


private

def user_params
  params.require(:user).permit(:name)
end


end
