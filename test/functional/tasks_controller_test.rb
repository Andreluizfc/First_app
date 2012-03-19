require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:test1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, :task => @task.attributes
    end

    assert_redirected_to task_path(assigns(:task))
  end

    assert_redirected_to tasks_path
  end
end
