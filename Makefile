all: migration start

migration:
	@echo "***********************"
	@echo "* START MIGRATIONS    *"
	@echo "***********************"
	@rails db:migrate

start:
	@echo "***********************"
	@echo "*   START SERVER      *"
	@echo "***********************"
    @rails server -p 3000 -b 0.0.0.0