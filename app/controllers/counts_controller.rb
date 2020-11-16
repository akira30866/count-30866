class CountsController < ApplicationController
  def index
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
    params.require(:count).permit(:image, :name, :remark, :category_id, :release_id, details_attributes: [:count_id, :title, :number, :probability, :_destroy]).merge(user_id: current_user.id)
  end
end
