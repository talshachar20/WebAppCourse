require 'test_helper'

class MemoCardsControllerTest < ActionController::TestCase
  setup do
    @memo_card = memo_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memo_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memo_card" do
    assert_difference('MemoCard.count') do
      post :create, memo_card: { id: @memo_card.id, word: @memo_card.word }
    end

    assert_redirected_to memo_card_path(assigns(:memo_card))
  end

  test "should show memo_card" do
    get :show, id: @memo_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memo_card
    assert_response :success
  end

  test "should update memo_card" do
    patch :update, id: @memo_card, memo_card: { id: @memo_card.id, word: @memo_card.word }
    assert_redirected_to memo_card_path(assigns(:memo_card))
  end

  test "should destroy memo_card" do
    assert_difference('MemoCard.count', -1) do
      delete :destroy, id: @memo_card
    end

    assert_redirected_to memo_cards_path
  end
end
