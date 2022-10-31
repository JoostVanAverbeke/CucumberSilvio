module ServiceHelpers
  def send_request(initiating_message)
    service = ServerInterface.new
    service.connect
    $logger.debug "Xmt>#{initiating_message.to_url}"
    response = service.request(initiating_message)
    $logger.debug "Rcv<#{response.to_url}"
    service.disconnect
    response
  end
end

World(ServiceHelpers)
