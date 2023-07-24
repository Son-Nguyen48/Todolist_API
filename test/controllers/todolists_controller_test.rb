require "test_helper"

class TodolistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todolist = todolists(:one)
  end

  test "should get index" do
    get todolists_url, as: :json
    assert_response :success
  end

  test "should create todolist" do
    assert_difference("Todolist.count") do
      post todolists_url, params: { todolist: { body: @todolist.body, title: @todolist.title } }, as: :json
    end

    assert_response :created
  end

  test "should show todolist" do
    get todolist_url(@todolist), as: :json
    assert_response :success
  end

  test "should update todolist" do
    patch todolist_url(@todolist), params: { todolist: { body: @todolist.body, title: @todolist.title } }, as: :json
    assert_response :success
  end

  test "should destroy todolist" do
    assert_difference("Todolist.count", -1) do
      delete todolist_url(@todolist), as: :json
    end

    assert_response :no_content
  end
end
