class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @userimg = @user.images.paginate(page: params[:page], per_page: 9)
    @userlikedimg = @user.find_liked_items.paginate(page: params[:page], per_page: 9)
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
end
