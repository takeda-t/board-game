class MessagesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "メッセージを投稿しました"
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = "メッセージを投稿できませんでした"
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content, :group_id)
  end
end
