all: helloworld docker

docker: helloworld
	docker build -t hello:alpine .

helloworld:
	go build -o bin/helloworld cmd/helloworld.go

clean:
	rm -f bin/**
