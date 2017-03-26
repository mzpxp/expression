class UsersController < ApplicationController
  
  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
   @likes = @user.likes
   @like_microposts = []
   @likes.each do |like|
   @like_microposts<<Micropost.find(like.micropost_id)
   end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)  
  end
end