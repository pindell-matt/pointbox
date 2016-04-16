class Admin::RewardsController < Admin::BaseController

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash.now[:notice] = "Reward Created!"
      redirect_to @rewards
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :value)
  end

end
