export IMAGE_NAME=lab-nlp
export APP_PATH := $(shell pwd)
export VERSION := main#v0.5
export USER := $(shell whoami)
export NB_GPUS := 1
export REGION := bhs
# build locally the docker image
build:
	docker build -t $(IMAGE_NAME) .
run-locally:build
	docker run --rm -it -v ${APP_PATH}/group:/etc/group -v ${APP_PATH}/passwd:/etc/passwd --user=ovh:ovh $(IMAGE_NAME)

deploy-job:
	ovhai job run \
		--gpu ${NB_GPUS} \
		--name ${IMAGE_NAME}-${USER} \
		--label ${USER}\
		--volume lab-nlp-data@${REGION}:/data:rw \
		--volume lab-nlp-notebook@${REGION}:/workspace/notebook:rw \
		ghcr.io/datalab-mi/${IMAGE_NAME}:${VERSION}
