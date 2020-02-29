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
    @user = User.find_by(id: params[:id], user_id: current_user.id)
    redirect_to user_path(current_user.id) if @user.blank?
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
