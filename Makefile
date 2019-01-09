
IMG ?= "c-kubectl:latest"

default: container

container:
	docker build -t $(IMG) .
	docker images $(IMG)

runtest: container
	docker run --rm $(IMG) kubectl version

clean:
	rm -f *~

.PHONY: default container runtest
