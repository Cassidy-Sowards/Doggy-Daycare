class DogsController < ApplicationController
    #before_action :correct_user,   only: :destroy
  def new
    @dog = Dog.new
  end
  
  def create
    @dog = current_user.dogs.build(dog_params)
    if @dog.save
      flash[:success] = "Dog created"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy 
    @dog.destroy
    flash[:success] = "Dog deleted"
    redirect_to request.referrer || root_url


  end
  
  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :color, :gender)
  end
  
  def correct_user
    @dog = current_user.dogs.find_by(id: params[:id])
      redirect_to root_url if @dog.nil?
  end
  
  
end

