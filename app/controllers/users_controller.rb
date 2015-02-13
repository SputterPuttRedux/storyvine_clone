class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to :back
    end
  end

  def new
  end

  def edit
    if @user.id == session[:user_id]
      render :edit
    else
      redirect_to :root
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      render :show
    else
     @errors = @user.errors.messages
     redirect_to :back
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :pic_url, :url, :bio)
  end


end
