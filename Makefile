# Makefile
DOCKER_ENV              ?= DOCKER_BUILDKIT=1
DOCKER_TAG              ?= 0.4
DOCKER_REGISTRY         ?= docker.io
DOCKER_REPOSITORY       ?= monandkey/free5gc-cli
DOCKER_BUILD_ARGS       ?= --rm

FREE5GC_CLI_IMAGE_NAME  ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}:${DOCKER_TAG}

build-all: build-free5gc-cli

.PHONY: build-free5gc-cli
build-free5gc-cli: 
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${FREE5GC_CLI_IMAGE_NAME} \
		--file ./Dockerfile \
		--no-cache \
		./

# Sample Command
# DOCKER_BUILDKIT=1 docker build --rm \
#   --tag docker.io/monandkey/free5gc-cli:0.4 \
#   --file ./Dockerfile \
#   --no-cache \
#   ./
