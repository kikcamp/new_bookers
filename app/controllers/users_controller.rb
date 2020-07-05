class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :set_user, only: [:update]

  def index
    @users = User.all

    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to action: :show, id:current_user.id, notice: '' if @user.id != current_user.id
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
