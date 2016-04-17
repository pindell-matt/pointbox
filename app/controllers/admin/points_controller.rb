class Admin::PointsController < Admin::BaseController

  def new
    @point = Point.new
  end

  def create
    @point = User.find(point_params[:user_id]).points.new(point_params)
    if @point.save
      flash[:notice] = "Point Assigned!"
      redirect_to admin_users_path
    else
      flash.now[:error] = "Invalid. Try Again."
      render :new
    end
  end

  private

  def point_params
    params.require(:point).permit(:value, :user_id)
  end

end
