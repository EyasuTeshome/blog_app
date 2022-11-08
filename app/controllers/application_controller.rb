class ApplicationController < ActionController::Base
  def current_user
    User.first
    User.second
  end
end
