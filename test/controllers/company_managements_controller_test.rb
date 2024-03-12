require "test_helper"

class CompanyManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get company_managements_new_url
    assert_response :success
  end

  test "should get create" do
    get company_managements_create_url
    assert_response :success
  end
end
