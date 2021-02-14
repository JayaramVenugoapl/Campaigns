module Error
  class RoutingError < CustomError
    def initialize
      super(:routing_error, 404, 'No route matches')
    end
  end
end
