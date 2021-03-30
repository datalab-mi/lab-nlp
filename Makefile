image_name=lab-nlp
build:
	docker build -t $(image_name) .
run-locally:build
	docker run --rm -it -v $(pwd)/group:/etc/group -v $(pwd)/passwd:/etc/passwd --user=ovh:ovh $(image_name)
