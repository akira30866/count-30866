class CountsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @counts = Count.includes(:user).order("created_at")
  end

  def new
    @count = Count.new
    @count.details.build
  end

  def create
    @count = Count.new(count_params)
    if @count.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def count_params
    params.require(:count).permit(:image, :name, :remark, :category_id, :release_id, details_attributes: [:id, :count_id, :title, :number, :probability, :_destroy]).merge(user_id: current_user.id)
  end
end
