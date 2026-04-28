.PHONY: help install dev build clean deploy start stop restart logs

help:
	@echo "JSJ Music Website - Available Commands:"
	@echo ""
	@echo "  make install    - Install dependencies"
	@echo "  make dev        - Start development server"
	@echo "  make build      - Build static site"
	@echo "  make clean      - Clean build artifacts"
	@echo "  make deploy     - Deploy with Docker"
	@echo "  make start      - Start Docker containers"
	@echo "  make stop       - Stop Docker containers"
	@echo "  make restart    - Restart Docker containers"
	@echo "  make logs       - View Docker logs"
	@echo ""

install:
	npm install

dev:
	npm run dev

build:
	npm run build

clean:
	rm -rf node_modules .next out
	npm install

deploy:
	npm run build
	docker-compose up -d --build

start:
	docker-compose up -d

stop:
	docker-compose down

restart:
	docker-compose restart

logs:
	docker-compose logs -f web
