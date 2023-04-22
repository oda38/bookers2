class UsersController < ApplicationController
  
   def index
    @users = User.all
    @new_book = Book.new
   end
  
  def create
    @user = User.new(user_params)
    if @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to users_path(@user.id)
    else
    render :top
    end
  end
  
  
  def show
    @new_book = Book.new
    @books = current_user.books 
  end

  def edit
    user = User.find(params[:id])
     unless user.id == current_user.id
    redirect_to books_path
     end
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
  params.require(:user).permit(:name, :profile_image)
end

end