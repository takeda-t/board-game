class ToppagesController < ApplicationController
  def index
    if logged_in?
      @groups = Group.order(id: :desc).page(params[:page])
    end
  end
end
