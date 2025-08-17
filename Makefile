watch-prepare: ## Install the tools required for the watch command
	go install github.com/air-verse/air@latest

watch: ## Run the service with hot reload
	air

## Build:
build: ## Build the service
	go build -o user-service

## Docker:
docker-compose: ## Start the service in docker
	docker-compose up -d --build --force-recreate

docker-build: ## Build the Docker image with a specified tag
	@echo "Building Docker image with tag '$(tag)'..."
	docker build --platform linux/amd64 -t mustofaadni04040/user-service:$(tag) .
	@echo "Docker image built with tag '$(tag)'"

docker-push: ## Push the Docker image with a specified tag
	@if "$(tag)"=="" ( \
		echo Error: Please specify the 'tag' parameter, e.g., make docker-push tag=1.0.0 & \
		exit 1 \
	) else ( \
		echo Building Docker image with tag $(tag)... & \
		docker push mustofaadni04040/user-service:$(tag) & \
		echo Docker image pushed with tag '$(tag)' \
	)
