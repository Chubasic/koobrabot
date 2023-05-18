APP_NAME=$(shell basename $(shell git remote get-url origin))
DOCKERHUB=chubasic
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=$(shell echo $$(uname) | tr 'A-Z' 'a-z') # darwin windows linux
ARCH=$(shell uname -m)
DOCK_ARCH=$(shell dpkg --print-architecture)
TARGET_ARCH=arm64 #amd64

format:
	 gofmt -s -w ./

lint:
	golint

test:
	go test -v

build: 
	go get | CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${DOCK_ARCH} go build -v -o koobrabot -ldflags "-X="github.com/Chubasic/koobrabot/cmd.app_version=${VERSION}

image:
	docker build . -t ${DOCKERHUB}/${APP_NAME}:${VERSION}-${TARGET_ARCH}

push:
	docker push ${DOCKERHUB}/${APP_NAME}:${VERSION}-${TARGET_ARCH}

clear:
	rm -rf koobrabot