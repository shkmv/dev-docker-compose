.PHONY: service start stop down logs

SERVICE_NAMES = scylladb

service:
	@echo "Available services: $(SERVICE_NAMES)"

start:
	@if [ -z "$(services)" ]; then \
		echo "Please specify service names using 'make start services=\"service1 service2\"'"; \
	else \
		for service in $(services); do \
			if [ -f $$service/docker-compose.yml ]; then \
				docker-compose -f $$service/docker-compose.yml up -d; \
			else \
				echo "Service $$service not found!"; \
			fi \
		done \
	fi

stop:
	@if [ -z "$(services)" ]; then \
		echo "Please specify service names using 'make stop services=\"service1 service2\"'"; \
	else \
		for service in $(services); do \
			if [ -f $$service/docker-compose.yml ]; then \
				docker-compose -f $$service/docker-compose.yml stop; \
			else \
				echo "Service $$service not found!"; \
			fi \
		done \
	fi

down:
	@if [ -z "$(services)" ]; then \
		echo "Please specify service names using 'make down services=\"service1 service2\"'"; \
	else \
		for service in $(services); do \
			if [ -f $$service/docker-compose.yml ]; then \
				docker-compose -f $$service/docker-compose.yml down -v; \
			else \
				echo "Service $$service not found!"; \
			fi \
		done \
	fi

logs:
	@if [ -z "$(services)" ]; then \
		echo "Please specify service names using 'make logs services=\"service1 service2\"'"; \
	else \
		for service in $(services); do \
			if [ -f $$service/docker-compose.yml ]; then \
				docker-compose -f $$service/docker-compose.yml logs -f; \
			else \
				echo "Service $$service not found!"; \
			fi \
		done \
	fi
