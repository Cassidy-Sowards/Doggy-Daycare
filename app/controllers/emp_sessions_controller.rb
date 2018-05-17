class EmpSessionsController < ApplicationController
  
  def new
  end
  
  def create 
    puts "in create"
    employee = Employee.find_by(email: params[:emp_sessions][:email].downcase)
    if employee && employee.authenticate(params[:emp_sessions][:password])
      #Log the user in and redirect to the user's show page.
      flash[:success] = "Login Successful"
      log_in employee
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy 
    emplog_out
    flash[:success] = "Employee Logged out"
    redirect_to root_url
  end
end
