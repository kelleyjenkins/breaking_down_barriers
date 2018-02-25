class EmployeesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @employee = Employee.new
  end

  def create
    user = User.find(params[:user_id])
    employee = user.build_employee(employee_params)
    if employee.save
      redirect_to "/users/#{user.id}"
    else
      render :new
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:street_address, :city, :state, :zip, :summary, :skills)
  end

end
