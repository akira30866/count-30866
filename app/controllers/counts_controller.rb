class CountsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_count, only: [:show]
  
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

  def show
  end

  private
  def count_params
    params.require(:count).permit(:image, :name, :remark, :category_id, :release_id, details_attributes: [:id, :count_id, :title, :number, :probability, :_destroy]).merge(user_id: current_user.id)
  end

  def find_count
    @count = Count.find(params[:id])
    @details = @count.details.build
  end
end
