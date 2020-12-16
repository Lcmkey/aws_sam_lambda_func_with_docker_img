define current_time
	[$(shell date +"%Y-%d-%m %H:%M:%S")]
endef


build:
	@ echo $(current_time): "$@ => Build docker images"
	docker-compose build
	@ echo $(current_time): "END"; echo ""
