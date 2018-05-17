class KennelsController < ApplicationController
  def new 
    @kennel = Kennel.new
  end
  
  def create
    @kennel = reservation.kennel.build(k_params)
       
  end
  
  def k_params
    params.require(:kennel).permit(:name)
  end
end
