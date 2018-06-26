class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.all.order('last_sign_in_at DESC')
  end

  def show
  end

  def update
    if @user.update(user_params)
        flash[:notice] = 'User Updated'
        redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    flash[:notice] = "User Removed"
    redirect_to admin_users_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :manager)
    end

end
