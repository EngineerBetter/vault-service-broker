class Service_catalog

  def get
   catalog_contents = YAML.load_file(ENV['SERVICE_CATALOG_FILE'])
  end

end
