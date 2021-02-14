module ResponseHandler
  def render_json(_data = "", _status = 200, _message = "")
    render :json => {
      status: _status,
      data: _data,
      message: _message
    }, :status => _status
  end
  
end