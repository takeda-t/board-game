class UsersController < ApplicationController
  before_action :require_user_log_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました。"
      redirect_to @user
    else
      flash[:danger] = "登録できませんでした。"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
