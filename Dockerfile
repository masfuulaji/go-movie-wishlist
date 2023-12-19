# Use the official Golang image as the base
FROM golang:1.21

# Set the working directory inside the container
WORKDIR /app

# Install Air for hot reloading
RUN go install github.com/cosmtrek/air@latest &&\
  go install github.com/a-h/templ/cmd/templ@latest

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code to the container
COPY . .

# Run the Go app
CMD ["air","-c",".air.toml"]
