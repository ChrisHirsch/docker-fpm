IMAGE=chrishirsch/fpm
CONTAINER=fpm
VERSION=1.11.0

build:
	docker build --rm --tag "$(IMAGE):$(VERSION)" .

clean:
	@docker rm -f $(CONTAINER) 2>/dev/null |:

shell: build
	docker run --rm --tty --interactive --entrypoint /bin/sh $(VOLUMES) "$(IMAGE):$(VERSION)"

push: build tag
	docker push $(IMAGE):$(VERSION)

tag:
	docker tag $(IMAGE):$(VERSION) $(IMAGE):$(VERSION)
