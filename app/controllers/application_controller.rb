class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  @@store = PStore.new("data.pstore")

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :notice => 'if you want to add a notice'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password , :user_type) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth , :user_type) }
  end

  def my_logger
    @@my_logger = Logger.new("#{Rails.root}/log/my.log")
  end


  def storing_user_data(action)
    @@store.transaction do
      @@store[:userid_store] = current_user.id
      @@store[:time_last_updated_store] = Time.now
      @@store[:action_made_by_user] = action
    end
  end

  def return_user_data_from_pstore
    current_user_id =  @@store.transaction { @@store[:userid_store] }
    current_time =  @@store.transaction { @@store[:time_last_updated_store] }
    action_by_user =  @@store.transaction { @@store[:action_made_by_user] }
    return "action: " + action_by_user.to_s + " userid: " + current_user_id.to_s + " time: " +  current_time.to_s
  end

end
