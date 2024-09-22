require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "name not null" do
    project = Project.new
    assert_not project.save
  end

  test "name is unique" do
    project = projects(:one)
    project_duplicate_name = Project.new
    project_duplicate_name.name = project.name
    assert_not project_duplicate_name.save
  end

  test "customer_name not null" do
    project = projects(:one)
    project.customer_name = nil
    assert_not project.save
  end
end
