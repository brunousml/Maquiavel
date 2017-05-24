# Running Tests (required mongo)
tests: start_mongo
	@ruby test/unit/test_parliamentarians.rb
	@make stop_mongo

# Execute dump parliamentarians (required mongo)
dump: start_mongo
	@ruby bin/importParliamentarians.rb

# Start docker mongo instance
start_mongo:
	@docker-compose up -d

# Stop docker mongo instance
stop_mongo:
	@docker-compose stop