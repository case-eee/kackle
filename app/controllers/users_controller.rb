class UsersController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success!"
      session[:user_id] = @user.id
      TwilioMessage.activate(@user.phone)
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
      check_status
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

  def check_status
    if params[:user][:active] && current_user.active
      flash[:success] = "Successfully subscribed!"
      TwilioMessage.activate(current_user.phone)
    elsif params[:user][:active] && current_user.active == false
      flash[:success] = "Successfully unsubscribed."
    end
  end
end
