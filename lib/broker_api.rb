class Service_catalog
  def get(message)
    if message.nil?
      return "this is the default string"
    else
      return message
    end
  end
end
