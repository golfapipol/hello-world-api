default: all

all: pull lint unit-test build-artifact deploy acceptance-test

preinstall:
	go get -u github.com/golangci/golangci-lint/cmd/golangci-lint

pull:
	git pull origin master

lint:
	golangci-lint run

run:
	go run cmd/main.go

unit-test:
	go test ./...

build:
	go build -o ./bin/app ./cmd

build-artifact:
	docker build -t app .

deploy:
	docker run -p 3000:3000 -e PORT=3000 --name hello-world-app -d app 

acceptance-test:
	curl localhost:3000/helloworld

teardown:
	docker stop hello-world-app
	docker rm hello-world-app