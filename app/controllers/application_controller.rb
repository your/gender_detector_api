class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :authenticate!

  def authenticate!
    unless APP_AUTH['auth']['tokens'].include?(request.headers['X-Client-Token'])
      render nothing: true, status: 403
    end
  end
end
