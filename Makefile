IMAGE_NAME = s2i-python-container

.PHONY: fist
first:
	docker build --target FirstStage -t $(IMAGE_NAME)-first-stage --no-cache .

.PHONY: build
build:
	docker build --target Build -t $(IMAGE_NAME) --no-cache .

.PHONY: push
push:
	docker tag $(IMAGE_NAME) registry.gz.cvte.cn/infra/$(IMAGE_NAME):latest
	docker push registry.gz.cvte.cn/infra/$(IMAGE_NAME):latest

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
