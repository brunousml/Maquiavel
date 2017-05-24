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

# Makefile
#### To execute tests
This command will start mongo, execute tests and stop mongo

```make tests```

#### To start mongo
This command execute docker-compose up -d

```make start_mongo```

#### To stop mongo
This command execute docker-compose stop

```make stop_mongo```

#### To dump parliamentarians
This command start mongo and import parliamentarians

```make dump```