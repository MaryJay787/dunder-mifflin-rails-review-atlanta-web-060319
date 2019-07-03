class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new

    if @employee.save(employee_path)
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_path)
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end

  private

  def employee_path
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end
end
