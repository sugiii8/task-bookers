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

  private

  def set_user
    @user = User.find(params[:id])
  end
end
