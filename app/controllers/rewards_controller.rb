class RewardsController < ApplicationController

  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @reward = @user.rewards.new
  end

  def create
    @reward = @user.rewards.new
    byebug
  end

end
