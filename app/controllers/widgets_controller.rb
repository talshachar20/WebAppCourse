class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if user_signed_in?
      redirect_to :controller => 'memo_cards', :action => 'index'
    end
  end

end
