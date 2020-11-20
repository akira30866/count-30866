class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @counts = @user.counts
  end
end
