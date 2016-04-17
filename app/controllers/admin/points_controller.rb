class Admin::PointsController < Admin::BaseController
  before_action :set_user, only: [:new, :create]

  def new
    @point = @user.points.new
  end

  def create
    @point = @user.points.new(point_params)
    if @point.save
      flash[:notice] = "Points Assigned!"
      redirect_to admin_user_path(@user)
    else
      flash.now[:error] = "Invalid. Try Again."
      render :new
    end
  end

  private

  def point_params
    params.require(:point).permit(:value, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
