class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to user_path(current_user.id) unless params[:id].to_i == current_user.id

    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_user_params)
      flash[:notice] = t('flash.successful')
      redirect_to user_path(@user)
    else
      flash[:alert] = t('flash.error')
      @resource = @user
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_user_params
    params.require(:user).permit(:name, :profle_image, :introduction)
  end
end
