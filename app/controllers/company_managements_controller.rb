class CompanyManagementsController < ApplicationController
  before_action :authenticate_user!

  def new
    @company_management = current_user.build_company_management
  end

  def create
    @company_management = current_user.build_company_management(company_management_params)

    if @company_management.save
      redirect_to root_path, notice: 'Company Management created successfully.'
    else
      render :new
    end
  end

  private

  def company_management_params
    params.require(:company_management).permit(:company, :email, :phone_number, :status)
  end
end