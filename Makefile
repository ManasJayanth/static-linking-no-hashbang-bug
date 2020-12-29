all:
	make docker-build
	make docker-run
	make docker-cp
	make x-bit
	./hello-static ./script.sh

docker-build:
	docker build -t try-static .

docker-run:
	docker container run -itd --name try-static-container try-static

docker-cp:
	docker cp try-static-container:/app/esy/hello $(PWD)/hello-static

x-bit:
	chmod u+x ./script.sh
