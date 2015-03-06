class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_categories
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def initialize_cart
    @cart = Cart.build_from_hash session
  end

  def find_categories
    @categories = Category.all
  end

  def authenticate_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: "You are not allowed to perform the operation"
    end
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
  end

end
