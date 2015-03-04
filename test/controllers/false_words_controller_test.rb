require 'test_helper'


class FalseWordsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @false_word = false_words(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:false_words)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create false_word" do
    assert_difference('FalseWord.count') do
      post :create, false_word: { level: @false_word.level, word: @false_word.word, word_id: @false_word.word_id }
    end

    assert_redirected_to false_word_path(assigns(:false_word))
  end

  test "should show false_word" do
    get :show, id: @false_word
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @false_word
    assert_response :success
  end

  test "should update false_word" do
    patch :update, id: @false_word, false_word: { level: @false_word.level, word: @false_word.word, word_id: @false_word.word_id }
    assert_redirected_to false_word_path(assigns(:false_word))
  end

  test "should destroy false_word" do
    assert_difference('FalseWord.count', -1) do
      delete :destroy, id: @false_word
    end

    assert_redirected_to false_words_path
  end
end
