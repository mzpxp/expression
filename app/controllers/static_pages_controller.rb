class StaticPagesController < ApplicationController
  def home
    if logged_in?
    tag = params[:tag]
     @micropost = current_user.microposts.build
     @feed_items = current_user.feed_items(tag).includes(:user).order(created_at: :desc)
    end
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def timeline
    @feed_items = Micropost.all.order(created_at: :desc)
  end
  
end