class EmployeesController < ApplicationController
  #before_action :is_admin?, only: :create 
  def show
    @employee = Employee.find(params[:id])
  end
  def new 
    @employee = Employee.new
  end
  def create
    @employee = Employee.new(emp_params)
    if(@employee.admin != true)
      @employee.admin = false
    end
    if @employee.save
      flash[:success] = "Employee account created"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def emp_params 
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :admin)
  end
  
  def index 
    @employees = Employee.all
  end
  
  def is_admin?
    if :admin == true
      return true
    else
      return false
    end
  end
  
end
