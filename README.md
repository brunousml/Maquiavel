# opendata_crawler
Extract information about parliamentarians from brazilian open data

## Setup

#### Database
Setup your database information in ```lib/settings.rb```
```ruby
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
```

#### Start Mongo
```docker-compose up```

#### Running Tests
```ruby test/unit/test_parliamentarians.rb```

# Import Parliamentarians

```ruby bin/importParliamentarians.rb```