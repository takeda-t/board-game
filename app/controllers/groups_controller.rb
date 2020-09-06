class GroupsController < ApplicationController
  before_action :require_user_logged_in
  
  def show
    @group = Group.find(params[:id])
    @messages = @group.messages.page(params[:page]).per(10)
    @message = current_user.messages.build
  end
  
  def new
    @group = current_user.groups.build
  end
  
  def create
    @group = current_user.groups.build(group_params)
    
    if @group.save
      current_user.participate(@group)
      flash[:success] = "グループを作成しました。"
      redirect_to @group
    else
      flash[:danger] = "グループを作成できませんでした。"
      render :new
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :schedule, :place, :title, :category)
  end
end
