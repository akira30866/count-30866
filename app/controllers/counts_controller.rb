class CountsController < ApplicationController
  def index
  end

  def new
    @count = Count.new
  end

  def create
  end

  private
  def count_params
    params.require(:count).permit(:image, :name, :remark, :category_id, :release_id)
  end
end
