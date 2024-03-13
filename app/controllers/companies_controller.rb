class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end




  def show
    @company = Company.find(params[:id])
  end

  def back_to_show
    @student = company.find(params[:id])
    redirect_to companies_path(@company)
  end

  def new
    @company = Company.new
  end


  def edit

  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Công ty đã được tạo thành công.'
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Thông tin công ty đã được cập nhật thành công.'
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_index_url, notice: 'Công ty đã được xóa thành công.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end


  def company_params
    params.require(:company).permit(:company_code, :company_name, :address, :email, :phone, :website, :status)
  end
end
