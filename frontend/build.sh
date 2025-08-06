#!/bin/bash

docker build -t "${REGISTRY}/${REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}" .