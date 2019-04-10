VERSION=3.4.14
PROJECT_ID=zookeeper
PROJECT=registry.dev.witcom.services/openshift

all: build

build:
	docker build --pull -t ${PROJECT}/zookeeper:${VERSION} .

push: build
	docker push ${PROJECT}/zookeeper:${VERSION}

.PHONY: all build push
