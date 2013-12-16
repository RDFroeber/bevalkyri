class UsersController < ApplicationController  
  before_action :authenticated!, :set_user, :authorized!, except: [:new, :create]

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(params[:id])
    else
      render :new
    end
  end 

  private

  #### security ####
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorized!
    unless @user.id == session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end


end 