# This file is used to setup the constants in the project
# Required Constants:
#   PARLIAMENTARIANS_URL
#   ENV
#   EXTRACT_MONGO_DB_SETTINGS

# Url where open data is stored to public
PARLIAMENTARIANS_URL = "http://legis.senado.leg.br/dadosabertos/senador/lista/atual"

# Enviroment (development, production or tests)
ENV = "production"

# Mongo settings to extract information (development, production or tests)
EXTRACT_MONGO_DB_SETTINGS = {
    'production' => {
        'name' => "opendata_extract",
        'host' => "localhost",
        'port' => "27017",
    },

    'development' => {
        'name' => "opendata_extract_dev",
        'host' => "localhost",
        'port' => "27017",
    },

    'test' => {
        'name' => "opendata_extract_test",
        'host' => "localhost",
        'port' => "27017",
    },
}