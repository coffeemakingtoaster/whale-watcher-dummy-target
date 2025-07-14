# This file is for testing
FROM debian:latest AS runtime

RUN apt-get update && apt-get install -y npm
