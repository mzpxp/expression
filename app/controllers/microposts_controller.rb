class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Message created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Message deleted"
    redirect_to request.referrer || root_url
    end
  end
  
  # GET /microposts/top10
  # GET /microposts/top10.json
  def top10
    # @microposts = micropost.top10
    @microposts = Micropost.all
    logger.debug "———————#{@microposts}———————"
    respond_to do |format|
      format.html # top10.html.erb
      format.json { render json: @microposts }
    end
  end
  
      private
  def micropost_params
    params.require(:micropost).permit(:content, :tag)

end