# Start by using an official public image of Alpine.
FROM alpine as baseImage

# Install go in the Docker image.
RUN apk add --no-cache go

# Copy all of the files to the image.
COPY . .

# Expose the port so we can send messages locally.
EXPOSE 9050:9050

# Build the main.go file.
RUN go build main.go

# This is the command that will run when we start up a container that's made from this image.
CMD ["go", "run", "main.go"]
