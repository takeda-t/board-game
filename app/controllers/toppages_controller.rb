class ToppagesController < ApplicationController
  def index
    if logged_in?
      @groups = Group.order(id: :desc).page(params[:page])
    end
    
    @search_params = search_params
    @groups = Group.search(@search_params)
    
  end
  
  private
  
  def search_params
    params.fetch(:search, {} ).permit(:name, :schedule_from, :schedule_to, :title, :category)
  end
end
