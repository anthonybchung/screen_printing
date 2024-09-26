require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "Projects#index: list all projects" do
    get projects_url
    assert_response :success

    projects_amount_fixture = projects.count
    assert_equal projects_amount_fixture, assigns(:projects).length
  end

  test "Projects#index: search query filter list." do
    get projects_url, params: { q: "alo" }
    assert_response :success
    assert_equal 3, assigns(:projects).length
  end

  test "Projects#show: find project by id" do
    project = projects(:one)
    get project_url(project)
    assert_response :success
    assert_equal project, assigns(:project)
  end

  test "Projects#new: response with Project object" do
    get new_project_url
    assert_response :success

    assert_instance_of Project, assigns(:project)
  end

  test "Projects#create: Create a new project" do
    get new_project_url
    assert_response :success

    project_params = { project: {
      name: "Killer App",
      note: "Embroidery",
      due_date: "2024-10-11",
      customer_name: "I.T E.M"
    } }

    assert_difference "Project.count", 1 do
      post projects_path, params: project_params
    end
  end

  test "Projects#create: name is nil" do
    project_params = { project: {
      note: "Embroidery",
      due_date: "2024-10-11",
      customer_name: "I.T E.M"
    } }
    assert_difference "Project.count", 0 do
      post projects_path, params: project_params
    end

    assert_response :unprocessable_entity
    assert_template :new
  end

  test "Project#update: update name" do
    project = projects(:one)
    project_updated_params = {
      project: {
        name: "Updated data",
        note: project.note,
        due_date: project.due_date,
        customer_name: project.customer_name
      }
    }

    patch project_path(project), params: project_updated_params

    project.reload
    assert_equal "Updated data", project.name
    assert_redirected_to project_path(project)

    assert_equal "Project was successfully updated.", flash[:notice]
  end

  test "Project#update: update name nil" do
    project = projects(:one)
    project_updated_params_no_name = {
      project: {
        name: nil,
        note: project.note,
        due_date: project.due_date,
        customer_name: project.customer_name
      }
    }

    patch project_path(project), params: project_updated_params_no_name
    assert_response :unprocessable_entity
  end

  test "Project#destory: destroy project" do
    project = projects(:one)

    assert_difference "Project.count", -1 do
      delete project_path(project)
    end

    assert_redirected_to projects_path
    assert_equal "Project was successfully deleted.", flash[:notice]
  end
end
