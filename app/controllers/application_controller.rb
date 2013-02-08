class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_level

  private

  def check_level
    if user_signed_in?
      current_user.check_level

      total_secs = (current_user.next_level_up.to_i - current_user.last_level_up.to_i).to_f
      current_secs = (current_user.next_level_up.to_i - Time.now.to_i).to_f
      @level_percent = (current_secs / total_secs) * 100
    end
  end
end
