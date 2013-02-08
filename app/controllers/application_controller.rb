class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_level

  private

  def check_level
    if user_signed_in?
      current_user.check_level
    end
  end
end
