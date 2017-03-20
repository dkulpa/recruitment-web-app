class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"user-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_path, notice: 'User deleted'
    else
      flash[:alert] = 'User was not deleted!'
    end
  end

  def mailings
    @user = User.find(params[:id])

    MailSender.new(@user).send_email
    flash[:notice] = "Mail has been sent."
    redirect_to root_path
  end
end
