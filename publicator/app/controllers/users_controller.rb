class UsersController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]
  before_action :can_change, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user,
      notice: 'Success!'
    else
      render action: :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user,
      notice: 'Success!'
    else
      render action: :edit
    end
  end


  private

  def user_params
    params.
    require(:user).
    permit(:email, :name, :lates, :password,
           :password_confirmation)
  end

  def can_change
    unless user_signed_in? && current_user == user
      redirect_to user_path(params[:id])
    end
  end

  def user
    @user ||= User.find(params[:id])
  end
end
