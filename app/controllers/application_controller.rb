class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if Rails.env.staging?
    http_basic_authenticate_with name: ENV["HTTP_AUTH_NAME"], password: ENV["HTTP_AUTH_PASSWORD"]
  end

  before_action :authenticate_user!
  # before_action :just_signed_up?

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "Not Authorized"
    redirect_to root_path
  end

  # def just_signed_up?
  #   @just_signed_up = params[:just_signed_up]
  # end

  # protected

  # def authenticate_user!
  #   raise
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to root_path #, :notice => 'oops'
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  #   end
  # end
end
