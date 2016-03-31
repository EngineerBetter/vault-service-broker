class ServiceCatalog

  def get
   catalog_contents = YAML.load_file(ENV['SERVICE_CATALOG_FILE']).to_json
  end

end

class VaultService

  def provision
    puts "202"
  end

end
