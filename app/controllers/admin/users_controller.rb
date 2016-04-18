class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
