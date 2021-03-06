class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception, unless: -> { request.format.json? }
  protect_from_forgery with: :null_session

  def isWebRequest?
    request.subdomains[-1] != 'api'
  end
end
