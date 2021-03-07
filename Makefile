clean ::
	docker image rm alpine-make-gcc:3.13

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t alpine-make-gcc:3.13 -f Dockerfile .
	docker tag alpine-make-gcc:3.13 prantlf/alpine-make-gcc:3.13

run ::
	docker run --rm -it alpine-make-gcc:3.13 busybox sh

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-make-gcc:3.13
