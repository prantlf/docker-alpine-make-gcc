clean ::
	docker image rm alpine-make-gcc

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t alpine-make-gcc -f Dockerfile .
	docker tag alpine-make-gcc prantlf/alpine-make-gcc:latest

run ::
	docker run --rm -it alpine-make-gcc busybox sh

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-make-gcc:latest
