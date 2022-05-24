REPO=registry.makerdark98.dev
IMAGE_NAME=jupyter/notebook
VERSION=0.0.1

release: build publish publish-latest

build:
	@echo 'build docker image'
	docker build -t $(IMAGE_NAME) .

publish:
	@echo 'create tag $(VERSION)'
	docker tag $(IMAGE_NAME) $(REPO)/$(IMAGE_NAME):$(VERSION)
	docker push $(REPO)/$(IMAGE_NAME):$(VERSION)

publish-latest:
	@echo 'create tag latest'
	docker tag $(IMAGE_NAME) $(REPO)/$(IMAGE_NAME):latest
	docker push $(REPO)/$(IMAGE_NAME):latest
