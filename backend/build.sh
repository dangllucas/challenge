#!/bin/bash

./mvnw package || exit 1

docker build -t "${REGISTRY}/${REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}" .