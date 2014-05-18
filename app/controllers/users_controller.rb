class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :approve]
  def show
    @user = User.find(params[:id])
  end
  def index
   @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Waiting for approval"
      redirect_to root_url 
    else
      render 'new'
    end
  end
def edit
  
 end
def update
    
    if @user.update_attributes(user_params)
      flash[:success] = "Changed details!"
      redirect_to @user 
        else
      render 'edit'
    end
    end
     def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  def more
  @user = User.find(params[:id])
  @user.admin = @user.toggle!(:admin)
  flash[:notice] = 'User updated admin'
  redirect_to users_url
 end

  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                               :password_confirmation)
    end
    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end