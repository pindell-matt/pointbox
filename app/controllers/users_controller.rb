class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "Invalid. Try Again."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    reward = Reward.find(params.dig(:user,:rewards))
    if current_user.can_purchase?(reward)
      current_user.make_purchase(reward)
      current_user.rewards << reward
      flash[:notice] = "Reward Purchased!"
      redirect_to user_path
    else
      flash.now[:error] = "Insufficient Funds, Yo!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
