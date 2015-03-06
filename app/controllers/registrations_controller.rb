class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :password, :address, :city, :country, :postal_code)
  end
 
  def account_update_params
    params.require(:user).permit(:email, :password, :name, :password, :address, :city, :country, :postal_code)
  end
end