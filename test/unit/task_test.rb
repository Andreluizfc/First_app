require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  test "the truth" do
    assert true
  end
  
  #Tests if the name is null
  test "should_require_name" do
    task = create(:name => nil)
    assert task.errors.invalid?(:name), ":name should be required"
    assert_invalid task, "Task shouldn't be created"
  end
  
  #Tests if the name is too long
  test "name_too_long" do
    task = create(:name => 'This task has a name too long')
    assert task.errors.invalid?(:name), ":name too long"
    assert_invalid task, "Task shouldn't be created"
  end

  #Tests if the name is not String
  test "name_not_string" do
    task = create(:name => 123)
    assert task.errors.invalid?(:name), ":name is not string"
    assert_invalid task, "Task shouldn't be created"
  end

  #Tests if the status is not String
  test "status_not_strng" do
    task = create(:status => 123)
    assert task.errors.invalid?(:status), ":status is not string"
    assert_invalid task, "Task shouldn't be created"
  end
  
  #Method that create tasks for testing
  private
    def create(options={})
      Task.create({
        :name => "Unit test",
        :status => "undone"
        }.merge(options))
    end

end
