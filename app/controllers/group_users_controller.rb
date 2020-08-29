class GroupUsersController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    group = Group.find(params[:group_id])
    current_user.participate(group)
    flash[:success] = "グループに参加しました。"
    redirect_to group_path(group)
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.exit(group)
    flash[:success] = "グループを退会しました。"
    redirect_to root_url
  end
end
