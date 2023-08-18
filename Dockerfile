# Use the official Golang base image
FROM golang:latest as go-builder

# Set the working directory to /app
WORKDIR /app

# Copy your Go application source code into the container
COPY . /app

# Build the Go application
RUN go build -o main .

# Expose port 8080
EXPOSE 3000

# Define the command to run the executable
CMD ["./main"]
