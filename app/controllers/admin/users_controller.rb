class Admin::UsersController < Admin::BaseController
  # before_action :set_reward, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


#   def new
#     @reward = Reward.new
#   end
#
#   def create
#     @reward = Reward.new(reward_params)
#     if @reward.save
#       flash[:notice] = "Reward Created!"
#       redirect_to admin_rewards_path
#     else
#       render :new
#     end
#   end
#
#   def edit
#   end
#
#   def update
#     if @reward.update(reward_params)
#       flash[:notice] = "Reward Updated!"
#       redirect_to admin_rewards_path
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     @reward.destroy
#     redirect_to admin_rewards_path
#   end
#
#   private
#
#   def reward_params
#     params.require(:reward).permit(:name, :value)
#   end
#
#   def set_reward
#     @reward = Reward.find(params[:id])
#   end

end
