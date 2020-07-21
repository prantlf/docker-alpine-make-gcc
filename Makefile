clean ::
	docker image rm alpine-make-gcc

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile.3.12

build ::
	docker build -t alpine-make-gcc -f Dockerfile.3.12 .
	docker tag alpine-make-gcc prantlf/alpine-make-gcc:3.12
	docker build -t alpine-make-gcc .
	docker tag alpine-make-gcc prantlf/alpine-make-gcc:latest

run ::
	docker run --rm -it alpine-make-gcc busybox sh

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-make-gcc:3.12
	docker push prantlf/alpine-make-gcc:latest
