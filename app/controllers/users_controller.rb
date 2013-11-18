class UsersController < ApplicationController
  before_filter :new_user,       only: [:new, :create]
  before_filter :signed_in_user, except: [:new, :create]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #UserMailer.registration_confirmation(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    render 'edit_notification_settings' if params[:n] == "1"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    toDest = User.find(params[:id])
    if current_user?(toDest)
      flash[:error] = "Cannot delete yourself!"
      redirect_to root_url
    else
      toDest.destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end