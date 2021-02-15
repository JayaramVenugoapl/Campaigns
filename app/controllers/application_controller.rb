class ApplicationController < ActionController::API
  include Error::ErrorHandler
  include ResponseHandler
  include SerializableResource
  
  def routing_error
    raise Error::RoutingError
  end
end
