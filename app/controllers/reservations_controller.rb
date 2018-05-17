class ReservationsController < ApplicationController
  def new
    @reservations = Reservation.all
    @kennels = Kennel.all
    @reservation = Reservation.new
  end
  
  def create
    @reservation = current_user.reservations.build(r_params)
    @reservation.status = "booked"
    if(@reservation.report != true)
      @reservation.report = "false"
    end
    if @reservation.save
      flash[:success] = "Reservation has been made"
      redirect_to root_url
    else
      flash[:danger] = "Reservation was not successful, please try again"
      redirect_to root_url
    end
  end
  
  def r_params
    params.require(:reservation).permit(:dog_id, :kennel_id, :startdate, :enddate, :report)
  end

end
