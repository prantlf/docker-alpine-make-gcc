clean ::
	docker image rm alpine-make-gcc prantlf/alpine-make-gcc registry.gitlab.com/prantlf/docker-alpine-make-gcc

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t alpine-make-gcc .
	docker tag alpine-make-gcc prantlf/alpine-make-gcc
	docker tag alpine-make-gcc registry.gitlab.com/prantlf/docker-alpine-make-gcc

run ::
	docker run --rm -it alpine-make-gcc busybox sh

login ::
	docker login --username=prantlf
	docker login registry.gitlab.com --username=prantlf

pull ::
	docker pull prantlf/alpine-make-gcc
	docker pull registry.gitlab.com/prantlf/docker-alpine-make-gcc

push ::
	docker push prantlf/alpine-make-gcc

push ::
	docker push prantlf/alpine-make-gcc
	docker push registry.gitlab.com/prantlf/docker-alpine-make-gcc
	docker tag prantlf/alpine-make-gcc prantlf/alpine-make-gcc:3.16
	docker push prantlf/alpine-make-gcc:3.16
	docker tag registry.gitlab.com/prantlf/docker-alpine-make-gcc registry.gitlab.com/prantlf/docker-alpine-make-gcc:3.16
	docker push registry.gitlab.com/prantlf/docker-alpine-make-gcc:3.16
