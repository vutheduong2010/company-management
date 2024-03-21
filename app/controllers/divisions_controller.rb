class DivisionsController < ApplicationController
    def index
      @divisions = Division.all
      @divisions = @divisions.where("company_code LIKE ?", "%#{params[:search]}%") if params[:search].present?
      @divisions = @divisions.paginate(page: params[:page], per_page: 5)
    end

    def show
      @division = Division.find(params[:id])
    end

    def new
      @division = Division.new
    end


    def edit
      @division = Division.find(params[:id])
    end

    def create
      @division = Division.new(division_params)
      if @division.save
        redirect_to divisions_path, notice: 'Thông tin bộ phận đã được lưu thành công.'
      else
        render :new
      end
    end

    def update
      @division = Division.find(params[:id])
      if @division.update(division_params)
        redirect_to divisions_path, notice: 'Thông tin bộ phận đã được cập nhật thành công.'
      else
        render :edit, alert: 'Có lỗi xảy ra khi cập nhật thông tin bộ phận.'
      end
    end

    def destroy
      @division = Division.find(params[:id])
      @division.destroy
      redirect_to divisions_path, notice: 'Bộ phận đã được xóa thành công.'
    end

    private

    def set_division
      @division = Division.find(params[:id])
    end


    def division_params
      params.require(:division).permit(:company_code, :company_name, :branch_code, :branch_name, :division_code, :division_name, :address, :email, :phone)
    end
  end



