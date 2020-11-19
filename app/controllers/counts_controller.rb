class CountsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_count, only: [:show, :edit, :update]
  before_action :private_to_index, only: [:show]
  before_action :move_to_index, only: [:edit]
  
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

  def edit
  end

  def update
    if @count.update(count_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def count_params
    params.require(:count).permit(:image, :name, :remark, :category_id, :release_id, :trials,details_attributes: [:id, :count_id, :title, :number, :probability, :_destroy]).merge(user_id: current_user.id)
  end

  def find_count
    @count = Count.find(params[:id])
    @details = @count.details.includes(:count)
  end

  def private_to_index
    if user_signed_in? && current_user.id != @count.user && @count.release_id == 3
      redirect_to root_path
    end
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @count.user.id
      redirect_to root_path
    end
  end
end
