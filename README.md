# textfilter
This is an example repo on how to use Docker to manage a small web-based service that replaces spaces in text with "|" symbols.

### Dockerfile
A Dockerfile is a file that contains all of the commands used to build an image. 

### Makefile
A Makefile is used to provide ease when running the sample and to also give an example of what the commands do.

### main.go
A small Go file that provides a web service that converts any input text.

Example: `This is a message` into `This|is|a|message`.


# Using the Sample
First, call `make build-tf`. This will build the image. 

![docker build](https://github.com/Sakari-Woods-Unity/textfilter/blob/main/images/docker-build.png "docker build")

You can see the image built by calling `docker images`.

![docker images](https://github.com/Sakari-Woods-Unity/textfilter/blob/main/images/docker-images.png "docker images")


Second, call `make start-tf`. This will start the service, and the text `Server is listening...` should appear.

![docker start](https://github.com/Sakari-Woods-Unity/textfilter/blob/main/images/docker-start.png "docker start")

The `docker run` command creates a container from the image and starts it, we can see the running container here:

![docker container](https://github.com/Sakari-Woods-Unity/textfilter/blob/main/images/docker-containers.png "docker container")

Third, within a second window, make a curl request to localhost:9050 and provide a string. You should get back a returned string that has been altered.

Example: `curl -X POST localhost:9050 -d "This is a message"`

Finally, calling `make clean-tf` from the separate window will stop the container named `textfilter`, remove the container, and then remove the image.

For additional explanations on what each command does, please check the comments within each file.
