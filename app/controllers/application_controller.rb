class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "butrfly", password: "butrfly" if Rails.env.staging?
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "Not Authorized"
    redirect_to root_path
  end
end
