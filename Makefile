APP_NAME=$(shell basename $(shell git remote get-url origin))
# Registry name
REGISTRY=chubasic
# Get git tag and current commit hash as registry tag name
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
# lowercase -cmd OS name->os name 
TARGETOS=$(shell echo $$(uname) | tr 'A-Z' 'a-z') # darwin windows linux
ARCH=$(shell uname -m)
# DOCKER_ARCH=$(shell dpkg --print-architecture)
TARGET_ARCH=arm64 #amd64
DARWIN=darwin
LINUX=linux

format:
	 gofmt -s -w ./

lint:
	golint

test:
	go test -v

install:
	go get

build: install
	go build -v -o koobrabot -ldflags "-X="github.com/Chubasic/koobrabot/cmd.app_version=${VERSION}

linux: 
	CGO_ENABLED=0 GOOS=${LINUX} GOARCH=${TARGET_ARCH} $(MAKE) build

mac: 
	CGO_ENABLED=0 GOOS=${DARWIN} GOARCH=${TARGET_ARCH} $(MAKE) build
	
windows: 
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(MAKE) build


image: 
	docker build . -t ${REGISTRY}/${APP_NAME}:${VERSION}-${TARGET_ARCH} --build-arg TARGET_ARCH=${TARGET_ARCH} --build-arg CMD=${TARGETOS}

push:
	docker push ${REGISTRY}/${APP_NAME}:${VERSION}-${TARGET_ARCH}

# clean:
# 	rm -rf koobrabot

clean:
	docker rmi ${REGISTRY}/${APP_NAME}:${VERSION}-${TARGET_ARCH}

