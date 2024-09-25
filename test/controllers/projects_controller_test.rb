require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "Project#index: list all projects" do
    get projects_url
    assert_response :success

    projects_amount_fixture = projects.count
    assert_equal projects_amount_fixture, assigns(:projects).length
  end

  test "Project#index: search query filter list." do
    get projects_url, params: { q: "alo" }
    assert_response :success
    assert_equal 3, assigns(:projects).length
  end
end
