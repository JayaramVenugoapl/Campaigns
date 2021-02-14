class Api::BaseController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods  

  before_action :authenticate
  attr_reader :current_user

  private
  def authenticate
    authenticate_with_http_basic do |email, pass|
      @current_user = User.find_by(:email => email)
      raise Error::UnauthorizedError unless @current_user && @current_user.authenticate(pass)
    end
    
  end
end
