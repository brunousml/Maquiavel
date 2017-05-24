BASE_PATH = Dir.pwd

PARLIAMENTARIANS_URL = "http://legis.senado.leg.br/dadosabertos/senador/lista/atual"

EXTRACT_MONGO_SETTINGS = {
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

