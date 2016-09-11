
NGINX_VERSION = 1.10.1

.DEFAULT_GOAL := build

clean:
	-docker rmi amarkwalder/cdk-nginx:${NGINX_VERSION}
	-docker rmi amarkwalder/cdk-nginx:latest
.PHONY: clean

build:
	docker build -t amarkwalder/cdk-nginx:${NGINX_VERSION} .
.PHONY: build

tag:
	docker pull amarkwalder/cdk-nginx:${NGINX_VERSION}
	docker tag amarkwalder/cdk-nginx:${NGINX_VERSION} amarkwalder/cdk-nginx:latest
	docker push amarkwalder/cdk-nginx:latest
.PHONY: tag

run: build
	docker run -it --rm amarkwalder/cdk-nginx:${NGINX_VERSION}
.PHONY: run
