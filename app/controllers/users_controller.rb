class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(
      :last_name, :first_name, :email, :workplace
    )
  end

end
