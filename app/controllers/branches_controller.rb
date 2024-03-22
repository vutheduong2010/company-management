class BranchesController < ApplicationController
  def index
    @branches = Branch.all
    @branches = @branches.where("company_code LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @branches = @branches.paginate(page: params[:page], per_page: 5)
    @branch = Branch.new
  end

  def show
    @branch = Branch.find(params[:id])
  end


  def create
    @branch = Branch.new(branch_params)
    if @branch.save
      redirect_to branches_path, notice: 'Thông tin chi nhánh đã được lưu thành công.'
    else
      render :new
    end
  end

  def update
    @branch = Branch.find(params[:id])
    if @branch.update(branch_params)
      redirect_to branches_path, notice: 'Thông tin chi nhánh đã được cập nhật thành công.'
    else
      render :edit, alert: 'Có lỗi xảy ra khi cập nhật thông tin chi nhánh.'
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    redirect_to branches_path, notice: 'Chi nhánh đã được xóa thành công.'
  end

  private

  def set_branch
    @branch = Branch.find(params[:id])
  end


  def branch_params
    params.require(:branch).permit(:branch_code, :branch_name, :company_code, :company_name, :address, :area, :email, :phone, :website, :status)
  end
end
