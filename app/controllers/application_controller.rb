class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def set_current_page
    @current_page = params[:page] || 1
  end
end
