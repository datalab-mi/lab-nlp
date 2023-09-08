export IMAGE_NAME=lab-nlp
export APP_PATH := $(shell pwd)
export VERSION := v0.8.1
export USER := $(shell whoami)
export NB_GPUS := 0
export NB_CPUS := 4
export BUCKET_NAME := my-bucket
export REGION := GRA
dummy	:= $(shell touch artifacts)
export notebookid := $(shell grep -oP '(?<={"id":")[^"]*' notebook.json)


include ./artifacts
# build locally the docker image
build:
	docker build -t $(IMAGE_NAME) .
run-locally:build
	docker run --rm -it -v ${APP_PATH}/group:/etc/group -v ${APP_PATH}/passwd:/etc/passwd --user=ovh:ovh $(IMAGE_NAME)

# Deploy notebook to ovh
deploy-notebook:
	ovhai notebook run \
		--gpu ${NB_GPUS} \
		--cpu ${NB_CPUS} \
		--name ${IMAGE_NAME}-${USER} \
		--label user=${USER}\
		--volume ${BUCKET_NAME}@${REGION}:/workspace/data:rwd \
		--output json \
		 huggingface \
		 jupyterlabcollaborative > notebook.json \
		$(command)

list-notebook:
	ovhai notebook list


# open the notebook in notebook
open-notebook:
	@echo $(notebookid)
delete-notebook:
	ovhai notebook delete $(notebookid)


data-upload:
	ovhai data upload ${REGION} $(DST) $(SRC)
