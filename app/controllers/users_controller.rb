class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_path, notice: 'User deleted'
    else
      flash[:alert] = 'User was not deleted!'
    end
  end
end
