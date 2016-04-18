class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User Successfully Created!"
      redirect_to admin_user_path(@user)
    else
      flash.now[:error] = "Invalid Submission!"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    flash.notice = "User: #{@user.username} Updated!"

    redirect_to admin_user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.points.each { |point| point.destroy }
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
