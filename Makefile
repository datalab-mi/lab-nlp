export IMAGE_NAME=lab-nlp
export APP_PATH := $(shell pwd)
export VERSION := v0.7
export USER := $(shell whoami)
export NB_GPUS := 2
export REGION := gra
dummy	:= $(shell touch artifacts)
include ./artifacts
# build locally the docker image
build:
	docker build -t $(IMAGE_NAME) .
run-locally:build
	docker run --rm -it -v ${APP_PATH}/group:/etc/group -v ${APP_PATH}/passwd:/etc/passwd --user=ovh:ovh $(IMAGE_NAME)

# Deploy job to ovh
deploy-job:
	ovhai job run \
		--gpu ${NB_GPUS} \
		--name ${IMAGE_NAME}-${USER} \
		--label user=${USER}\
		--volume lab-nlp-data@${REGION}:/workspace/data:rw \
		--volume lab-nlp-notebook@${REGION}:/workspace/notebook:rw \
		--volume lab-nlp-code@${REGION}:/workspace/code:rw \
		--output json \
		ghcr.io/datalab-mi/${IMAGE_NAME}:${VERSION} > job.json \
		$(command)

list-job:
	ovhai job list

# open the job in notebook
jobid=$(grep -Po '"id":.*?[^\\]"' job.json |awk -F':' '{print $2}')
open-job:
	@echo $(jobid)
