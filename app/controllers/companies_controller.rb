class CompaniesController < ApplicationController
  def index
    @companies = Company.paginate(page: params[:page], per_page: 10)

    @companies = Company.where("company_code LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @company = Company.find(params[:id])
    # if @company
    #   redirect_to company_path(@company)
    # else
    #   flash[:error] = "Không tìm thấy công ty"
    #   redirect_to companies_path
    # end
  end

  def new
    @company = Company.new
  end


  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      @company.avatar.attach(params[:company][:avatar])
      redirect_to companies_path, notice: 'Thông tin công ty đã được lưu thành công.'
    else
      render :new
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path, notice: 'Thông tin công ty đã được cập nhật thành công.'
    else
      render :edit, alert: 'Có lỗi xảy ra khi cập nhật thông tin công ty.'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path, notice: 'Công ty đã được xóa thành công.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end


  def company_params
    params.require(:company).permit(:company_code, :company_name, :address, :email, :phone, :website, :status)
  end
end
