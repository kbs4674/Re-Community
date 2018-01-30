require 'test_helper'

class CommentQnasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comment_qnas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get comment_qnas_destroy_url
    assert_response :success
  end

end
