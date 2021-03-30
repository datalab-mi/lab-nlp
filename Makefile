export IMAGE_NAME=lab-nlp
export APP_PATH := $(shell pwd)
build:
	docker build -t $(IMAGE_NAME) .
run-locally:build
	docker run --rm -it -v ${APP_PATH}/group:/etc/group -v ${APP_PATH}/passwd:/etc/passwd --user=ovh:ovh $(IMAGE_NAME)

deploy-job:
	ovhai job run \
	--gpu 1 \
	--name lab-nlp-halting-bloembergen \
	docker.pkg.github.com/datalab-mi/lab-nlp/lab-nlp:v0.1
