clean ::
	docker image rm alpine-make-gcc:3.12

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t alpine-make-gcc:3.12 -f Dockerfile .
	docker tag alpine-make-gcc:3.12 prantlf/alpine-make-gcc:3.12

run ::
	docker run --rm -it alpine-make-gcc:3.12 busybox sh

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/alpine-make-gcc:3.12
