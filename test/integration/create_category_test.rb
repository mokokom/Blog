require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get new_category_path
    assert_response :success
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: { name: "Music" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Music", response.body
  end
end
