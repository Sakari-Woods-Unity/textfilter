build-tf:
	echo "Building..."
	docker build -t textfilterimage . # This builds the image and gives it a tag name of "textfilterimage". The "." means find "Dockerfile" within the current directory.
	docker images | grep textfilter # This outputs all of the Docker images and highlights the one we just created.

start-tf:
	docker run --name textfilter -p 9050:9050 textfilterimage # This creates a Docker container named "textfilter", exposes the local port 9050 and instructs the container to be built using the "textfilterimage" image.

clean-tf:
	docker stop textfilter # This stops the "textfilter" container".
	docker rm textfilter # This removes the "textfilter" container.
	docker rmi textfilterimage # This removes the "textfilterimage" image.