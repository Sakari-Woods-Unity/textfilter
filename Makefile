build-tf:
	echo "Building..."
	docker build -t textfilterimage .
	docker images | grep textfilter

start-tf:
	docker run --name textfilter -p 9050:9050 textfilterimage

clean-tf:
	docker stop textfilter
	docker rm textfilter
	docker rmi textfilterimage