.PHONY: service start stop logs

service:
	@echo "Available services:"
	@echo "- scylladb"
	@read -p "Enter service name: " service; \
	docker-compose -f $$service/docker-compose.yml up -d

start:
	@read -p "Enter service name: " service; \
	docker-compose -f $$service/docker-compose.yml up -d

stop:
	@read -p "Enter service name: " service; \
	docker-compose -f $$service/docker-compose.yml down

logs:
	@read -p "Enter service name: " service; \
	docker-compose -f $$service/docker-compose.yml logs -f
