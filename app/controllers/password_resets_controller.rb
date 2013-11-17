class PasswordResetsController < ApplicationController
  before_filter :new_user
  before_filter :user_for_reset, only: [:edit, :update]

  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user
      user.send_password_reset
      flash[:success] = t :password_reset_sent, email: user.email
      redirect_to signin_path
    else
      flash[:error] = t(:email_not_registered)
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, flash: { error: t(:password_reset_token_expired) }
    elsif @user.update_attributes(params[:user])
      redirect_to signin_path, flash: { success: t(:password_reset) }
    else
      render :edit
    end
  end

  private
    def user_for_reset
      @user = User.where(password_reset_token: (params[:id])).first
      redirect_to signin_path, flash: { error: t(:invalid_password_reset_token) } if @user.nil?
    end
end
