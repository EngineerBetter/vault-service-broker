class Service_catalog

  def get
   catalog_contents = YAML.load_file(ENV['SERVICE_CATALOG_FILE']).to_json
  end

end
