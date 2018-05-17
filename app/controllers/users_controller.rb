class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    @dogs = @user.dogs.paginate(page: params[:page])
    @reservations = @user.reservations.paginate(page: params[:page])
  end
  def new
    @user = User.new 
  end
  def create
   @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to Cassidy's Doggy Daycare"
      redirect_to user
    else
      render 'new'
    end
  end
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
  
  def index
    @users = User.all
  end

end
