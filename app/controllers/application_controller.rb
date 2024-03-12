class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.company_management.present?
      company_management_path
    else
      new_company_management_path
    end
  end
end
