class UsersController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully subscribed!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Successfully unsubscribed."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was a problem."
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :phone, :password, :password_confirmation, :active)
  end
end
