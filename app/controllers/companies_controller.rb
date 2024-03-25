class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @companies = @companies.where("company_code LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @companies = @companies.paginate(page: params[:page], per_page: params[:per] || 5)
    @company = Company.new

  end

  def show
    @company = Company.find(params[:id])
    @avatar_url = if @company.avatar.attached?
                    url_for(@company.avatar.first) # Sử dụng first để lấy một tệp đính kèm đầu tiên (nếu có)
                  else
                    nil
                    # if @company
                    #   redirect_to company_path(@company)
                    # else
                    #   flash[:error] = "Không tìm thấy công ty"
                    #   redirect_to companies_path
                    # end
                  end
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

  def update_avatar
    @company = Company.find(params[:id])
    if params[:company].present? && params[:company][:avatar].present?
      @company.avatar.attach(params[:company][:avatar])
      redirect_to @company, notice: 'Avatar was successfully uploaded.'
    else
      redirect_to @company, alert: 'No avatar file uploaded.'
    end
  end

  def remove_avatar
    @company = Company.find(params[:id])
    @company.avatar.purge
    redirect_to @company, notice: 'Avatar was successfully removed.'
  end


  private

  def set_company
    @company = Company.find(params[:id])
  end


  def company_params
    params.require(:company).permit(:company_code, :company_name, :address, :email, :phone, :website, :status)
  end
end
