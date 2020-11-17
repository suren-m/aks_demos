OWNER := surenmcode
REPO := redisbench
VERSION := 1.0.10
OPV := $(OWNER)/$(REPO):$(VERSION)

all: build launch

test: build shell

build:
	docker build . -t $(OPV) 

clean:
	docker image rm $(OPV) | true

push:
	docker push $(OPV)

shell:
	docker run \
	--rm --name $(REPO) \
	-e CACHE_HOST=${CACHE_HOST} \
	-e CACHE_KEY=${CACHE_KEY} \
	-it $(OPV) \
	sh

logs:
	docker logs -f $(REPO)

launch:
	docker run \
	--rm --name $(REPO) \
	-e CACHE_HOST=${CACHE_HOST} \
	-e CACHE_KEY=${CACHE_KEY} \
	-it $(OPV) \
	sh -c './init.sh'